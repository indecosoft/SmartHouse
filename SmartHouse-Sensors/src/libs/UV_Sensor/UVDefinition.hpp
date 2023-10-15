#pragma once
#include <Arduino.h>
#include <ArduinoJson.h>
#include <Sensor.h>

#define UV_SENSOR_DEFAULT_PIN A0

class UVSensor : public Sensor
{
private:
    uint8_t pin;
    int getUVIndex();

public:
    UVSensor(int);
    DynamicJsonDocument read();
};