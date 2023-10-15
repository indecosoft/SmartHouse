#pragma once
#include <Arduino.h>
#include <dht11.h>
#include <DHT.h>
#include <Sensor.h>
#define DHT11_DEFAULT_PIN D5
class TempSensor : public Sensor
{

private:
    DHT *dht;
    int readTemperature();
    int readHumidity();

public:
    TempSensor(int);
    DynamicJsonDocument read();
};
