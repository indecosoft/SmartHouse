#pragma once

#include <Arduino.h>
#pragma once

#include <ArduinoJson.h>
#include <libs/TempSensor/TempSensorDefinition.hpp>

TempSensor::TempSensor(int pin = DHT11_DEFAULT_PIN)
{
    this->dht = new DHT(pin, DHT11);
    this->dht->begin();
}

int TempSensor::readTemperature()
{
    return (int)this->dht->readTemperature();
}
int TempSensor::readHumidity()
{
    return (int)this->dht->readHumidity();
}

DynamicJsonDocument TempSensor::read()
{
    DynamicJsonDocument json(1024);
    json["temperature"] = readTemperature();
    json["humidity"] = readHumidity();
    return json;
}