#pragma once
#include <Arduino.h>
#include <Wire.h>
#include <ArduinoJson.h>
#include <BH1750.h>
#include <Sensor.h>

#define SDA_DEFAULT_PIN D5
#define SCL_DEFAULT_PIN D6
#define READING_MODE_DEFAULT_PIN BH1750::CONTINUOUS_HIGH_RES_MODE_2

class LightSensor : public Sensor
{
private:
    BH1750 lightMeter;

public:
    LightSensor(int, int, BH1750::Mode);
    DynamicJsonDocument read();
};