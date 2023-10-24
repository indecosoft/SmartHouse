#pragma once
#include <libs/UV_Sensor/UVDefinition.hpp>

UVSensor::UVSensor(int pin = UV_SENSOR_DEFAULT_PIN)
{
    this->pin = pin;
}
int UVSensor::getUVIndex()
{
    int voltage = (analogRead(this->pin) * (5.0 / 1023.0)) * 1000;

    if (voltage < 50)
    {
        return 0;
    }
    else if (voltage > 50 && voltage <= 227)
    {
        return 0;
    }
    else if (voltage > 227 && voltage <= 318)
    {
        return 1;
    }
    else if (voltage > 318 && voltage <= 408)
    {
        return 1;
    }
    else if (voltage > 408 && voltage <= 503)
    {
        return 3;
    }
    else if (voltage > 503 && voltage <= 606)
    {
        return 4;
    }
    else if (voltage > 606 && voltage <= 696)
    {
        return 5;
    }
    else if (voltage > 696 && voltage <= 795)
    {
        return 6;
    }
    else if (voltage > 795 && voltage <= 881)
    {
        return 7;
    }
    else if (voltage > 881 && voltage <= 976)
    {
        return 8;
    }
    else if (voltage > 976 && voltage <= 1079)
    {
        return 9;
    }
    else if (voltage > 1079 && voltage <= 1170)
    {
        return 10;
    }
    else if (voltage > 1170)
    {
        return 11;
    }
    return -1;
}

DynamicJsonDocument UVSensor::read()
{
    int valueFromSensor = getUVIndex();

    DynamicJsonDocument json(1024);
    json["UVIndex"] = valueFromSensor == -1 ? "Error reading UV index" : String(valueFromSensor);
    String jsonString;
    serializeJson(json, jsonString);
    // json.prettyPrintTo(Serial);
    return json;
}
