#pragma once

#include <libs/LightSensor/LightSensorDefinition.hpp>

DynamicJsonDocument LightSensor::read()
{
    DynamicJsonDocument json(1024);
    json["light"] = this->lightMeter.readLightLevel();
    String data;
    serializeJson(json, data);
    // json.prettyPrintTo(Serial);
    return json;
}
LightSensor::LightSensor(int sda = SDA_DEFAULT_PIN, int scl = SCL_DEFAULT_PIN, BH1750::Mode readingMode = READING_MODE_DEFAULT_PIN)
{
    Wire.begin(sda, scl);
    if (lightMeter.begin(readingMode))
    {
        Serial.println(F("BH1750 begin with custom values"));
    }
    else
    {
        Serial.println(F("Error initialising BH1750 with custom values"));
    }
}
