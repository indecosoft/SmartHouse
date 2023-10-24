#pragma once

#include <Arduino.h>
#include <Ticker.h>
#include <Sensor.h>
#include <JC_Button.h>
#define RELAY_DEFAULT_PIN D6
#define RELAY_BUTTON_DEFAULT_PIN D5

class Relay : public Sensor
{
private:
    uint8_t pin;
    Ticker swTicker;
    Button *swButton;

public:
    Relay(int, int);
    void changeState(int);
    DynamicJsonDocument read();
};