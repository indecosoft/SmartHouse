#pragma once

#include <Arduino.h>
#include <libs/Relay/RelayDefinition.hpp>

Relay::Relay(int pin = RELAY_DEFAULT_PIN, int button_pin = RELAY_BUTTON_DEFAULT_PIN)
{
    this->pin = pin;
    pinMode(this->pin, OUTPUT);
    digitalWrite(this->pin, LOW);
    swButton = new Button(button_pin);
    swButton->begin();
    swTicker.attach(0.1, [&]() {
        swButton->read();
        if (swButton->wasReleased())
        {
            digitalWrite(this->pin, !(digitalRead(this->pin)));
        }
    });
}
void Relay::changeState(int power)
{
    digitalWrite(this->pin, power);
}
DynamicJsonDocument Relay::read()
{
    DynamicJsonDocument json(1024);
    json["status"] = digitalRead(this->pin);
    return json;
}
