#pragma once
#include <Arduino.h>
#include <ArduinoJson.h>
#include <Sensor.h>

#define INLINE_CONTACT_DEFAULT_PIN A0
class InlineContact : public Sensor
{

private:
    uint8_t pin;

public:
    InlineContact(int);
    DynamicJsonDocument read();
};
