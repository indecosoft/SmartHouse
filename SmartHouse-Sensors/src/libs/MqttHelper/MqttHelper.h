#include <libs/MqttHelper/MqttHelperDefinition.hpp>

MqttHelper::MqttHelper(Config *config = new Config(), Sensor *relay = nullptr, int port = 1883)
{
    this->config = config;
    this->relay = relay;
    auto address = this->config->getServerAddress();
    if (server->fromString(address))
    {
        Serial.println("IP");
        int Parts[4] = {0, 0, 0, 0};
        int Part = 0;
        for (int i = 0; i < address.length(); i++)
        {
            char c = address[i];
            if (c == '.')
            {
                Part++;
                continue;
            }
            Parts[Part] *= 10;
            Parts[Part] += c - '0';
        }
        server = new IPAddress(Parts[0], Parts[1], Parts[2], Parts[3]);
    }
    else
    {
        Serial.println("Domain");

        this->domain = this->config->getServerAddress();
    }
    this->port = port;
}
MqttHelper::~MqttHelper()
{
    client.disconnect();
}

void MqttHelper::initMqtt()
{
    Serial.print(*(this->server));
    Serial.print(":");
    Serial.println(this->port);
    if (this->domain == "")
    {
        this->client.setServer(*(this->server), this->port);
    }
    else
    {
        this->client.setServer(this->domain.c_str(), this->port);
    }

    client.setCallback([&](char *topic, uint8_t *payload, unsigned int length)
                       {
        Serial.println("callback");
        char *msg = (char *)payload;
        DynamicJsonDocument json(1024);
        deserializeJson(json, msg);
        serializeJsonPretty(json, Serial);
        String deviceMacAddress = WiFi.macAddress();
        String receivedMacAddress = json["macAddress"];
        deviceMacAddress.toUpperCase();
        receivedMacAddress.toUpperCase();
        if (receivedMacAddress.compareTo(deviceMacAddress) == 0)
        {
            if (json["event"] == "reboot")
            {
                ESP.restart();
            }
            else if (json["event"] == "reset")
            {
                hardwareButtons.instantReset();
            }
            else if (json["event"] == "on" && relay != nullptr)
            {
                // digitalWrite(D8, LOW);
                relay->changeState(HIGH);
                // Serial.println(relay->read());
                DynamicJsonDocument json(1024);
                json["macAddress"] = WiFi.macAddress();
                json["state"] = 1;
                // json["account"] = "test@test.ro";
                String data;
                Serial.println("send");

                serializeJsonPretty(json, Serial);
                // publish("response", data.c_str());
            }
            else if (json["event"] == "off" && relay != nullptr)
            {
                // digitalWrite(D8, HIGH);
                // Serial.println(relay->read());
                relay->changeState(LOW);
                DynamicJsonDocument json(1024);
                json["macAddress"] = WiFi.macAddress();
                json["state"] = 0;
                // json["account"] = "test@test.ro";

                String data;
                Serial.println("send");
                serializeJsonPretty(json, Serial);
                // publish("response", data.c_str());
            }
            else if (json["event"] == "config")
            {
                Serial.println("Saving configuration file");
                Serial.println("reading config file");
                File configFile = SPIFFS.open("/config.json", "r");
                if (configFile)
                {
                    Serial.println("opened config file");
                    size_t size = configFile.size();
                    // Allocate a buffer to store contents of the file.
                    std::unique_ptr<char[]> buf(new char[size]);

                    configFile.readBytes(buf.get(), size);
                    DynamicJsonDocument json(1024);
                    DynamicJsonDocument currentSettingsJson(1024);
                    deserializeJson(currentSettingsJson, buf.get());
                    json["account"] = currentSettingsJson["account"];
                    json["server"] = currentSettingsJson["server"];
                    json["port"] = currentSettingsJson["port"];
                    json["freqMinutes"] = json["config"]["freq"];
                    json["sensorName"] = json["config"]["name"];
                    json["sensorType"] = json["config"]["sensorType"];

                    File configFile = SPIFFS.open("/config.json", "w");

                    serializeJson(json, configFile);
                    serializeJsonPretty(json, Serial);
                    configFile.close();
                    ESP.restart();
                }
            }
        } });
    // this->client.connect(WiFi.macAddress().c_str());
}
void MqttHelper::connect(String name)
{
    this->mqttTicker.detach();
    if (this->client.connect(name.c_str()))
    {
        if (this->client.subscribe("SensorsSettingsChannel"))
        {
            Serial.println("Succesfully subscribed to SensorsSettingsChannel");
        }
        this->mqttTicker.attach(1, [&]()
                                { this->client.loop(); });
    }
}
bool MqttHelper::isConnected()
{
    return this->client.connected();
}
void MqttHelper::publish(String topic, String message)
{
    this->client.publish(topic.c_str(), message.c_str());
}