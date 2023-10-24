#pragma once
#include <Arduino.h>
#include <ArduinoJson.h>
#include <TroykaMQ.h>
#include <Sensor.h>
#define MQ2_DEFAULT_PIN A0
#define MQ2_SPEAKER_DEFAULT_PIN D6

class GasAndSmokeSensor : public Sensor
{

private:
    uint8_t speakerPin = MQ2_SPEAKER_DEFAULT_PIN;
    MQ2 *mq2;
    void calibrateSensor();

public:
    GasAndSmokeSensor(int, int);
    DynamicJsonDocument read();
};