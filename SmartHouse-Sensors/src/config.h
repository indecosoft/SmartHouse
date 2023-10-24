#pragma once

#include <libs/TempSensor/TempSensor.h>

#include <libs/Relay/Relay.h>
#include <libs/LightSensor/LightSensor.h>
#include <libs/InlineContact/InlineContact.h>
#include <libs/GasAndSmokeSensor/GasAndSmokeSensor.h>
#include <libs/UV_Sensor/UVSensor.h>
#include <ArduinoJson.h>
#include <FS.h>
#include <libs/HardwareButtons/HardwareButtons.h>


using namespace std;

auto buttons = new HardwareButtons();
typedef enum
{
    SENSOR_UNDEFINED,
    SENSOR_UV,
    SENSOR_SWITCH,
    SENSOR_TEMP_AND_HUMIDITY,
    SENSOR_LIGHT,
    SENSOR_GAS_AND_SMOKE,
    SENSOR_DOOR
} SENSOR_TYPE;

SENSOR_TYPE sensorType = SENSOR_UNDEFINED;

class Config
{

private:
    std::string random_string(size_t length)
    {
        auto randchar = []() -> char {
            const char charset[] =
                "0123456789"
                "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                "abcdefghijklmnopqrstuvwxyz";
            const size_t max_index = (sizeof(charset) - 1);
            return charset[rand() % max_index];
        };
        std::string str(length, 0);
        std::generate_n(str.begin(), length, randchar);
        return str;
    }

public:
    Config() { SPIFFS.begin(); }
    void initPinsToGetConfig();
    bool writeConfig(DynamicJsonDocument);
    bool hasWiFiCredentials();
    String getServerAddress();
    String readConfig();
    DynamicJsonDocument getWifiCredentials();
};
void Config::initPinsToGetConfig()
{
    Serial.println(analogRead(A0) * (5.0 / 1023.0));
    if (analogRead(A0) > 10 && analogRead(A0) < 100) // 10K
    {
        Serial.println("Switch");
        sensorType = SENSOR_SWITCH;
    }
    else if (analogRead(A0) > 100 && analogRead(A0) < 330) // GAS
    {
        Serial.println("Gas");
        sensorType = SENSOR_GAS_AND_SMOKE;
    }
    else if (analogRead(A0) > 490 && analogRead(A0) < 600) // 100
    {
        Serial.println("Temp");
        sensorType = SENSOR_TEMP_AND_HUMIDITY;
    }
    else if (analogRead(A0) > 700 && analogRead(A0) < 800) // 22
    {
        Serial.println("Light");
        sensorType = SENSOR_LIGHT;
    }
    else if (analogRead(A0) >= 0 && digitalRead(D0) == LOW) // 4,7K
    {
        Serial.println("UV");
        sensorType = SENSOR_UV;
    }
    else if (analogRead(A0) > 0 && digitalRead(D0) == HIGH)
    {
        Serial.println("Door");
        sensorType = SENSOR_DOOR;
    }
    else if (analogRead(A0) == 1024 && digitalRead(D0) == HIGH)
    {
        Serial.println("Door");
        sensorType = SENSOR_DOOR;
    }
    else
    {
        Serial.println("Undefined Sensor");
    }

    if (!SPIFFS.exists("/config.json"))
    {
        Serial.println("Config doesn't exist");
        DynamicJsonDocument json(1024);
        json["sensorName"] = this->random_string(10).c_str();
        json["macAddress"] = WiFi.macAddress();
        json["sensorType"] = (int)sensorType;
        json["freqMinutes"] = 10;
        serializeJsonPretty(json, Serial);
        writeConfig(json);
    }
}
DynamicJsonDocument Config::getWifiCredentials()
{
    DynamicJsonDocument doc(1024);
    DynamicJsonDocument json(1024);
    deserializeJson(json, this->readConfig());
    if (json.containsKey("ssid") && json.containsKey("password"))
    {
        doc["ssid"] = json["ssid"];
        doc["password"] = json["password"];
        return doc;
    }
    else
    {
        return doc;
    }
}
String Config::getServerAddress()
{
    DynamicJsonDocument json(1024);
    deserializeJson(json, this->readConfig());
    return json["server"];
}
bool Config::hasWiFiCredentials()
{
    DynamicJsonDocument json(1024);
    deserializeJson(json, this->readConfig());

    JsonVariant ssid = json["ssid"];
    JsonVariant password = json["password"];
    if (!ssid.isNull() || !password.isNull())
    {
        return true;
    }
    return false;
}
String Config::readConfig()
{
    if (SPIFFS.exists("/config.json"))
    {
        Serial.println("reading config file");
        File configFile = SPIFFS.open("/config.json", "r");
        if (configFile)
        {
            Serial.println("opened config file");
            size_t size = configFile.size();
            // Allocate a buffer to store contents of the file.
            std::unique_ptr<char[]> buf(new char[size]);

            configFile.readBytes(buf.get(), size);

            DynamicJsonDocument json(size);
            auto error = deserializeJson(json, buf.get());

            if (!error)
            {
                Serial.println("Successfully read Json from EEPROM");
                String data;
                serializeJson(json, data);
                serializeJsonPretty(json, Serial);
                return data;
            }
            else
            {
                Serial.println("Failed to load json config from EEPROM");
                buttons->instantReset();
                return "{}";
            }
            configFile.close();
        }
    }
    return "{}";
}
bool Config::writeConfig(DynamicJsonDocument json)
{

    File configFile = SPIFFS.open("/config.json", "w");

    serializeJson(json, configFile);
    configFile.close();
    return true;
}