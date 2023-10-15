#pragma once
#include <libs/InlineContact/InlineContactDefinition.hpp>

InlineContact::InlineContact(int pin = INLINE_CONTACT_DEFAULT_PIN)
{
    this->pin = pin;
}
DynamicJsonDocument InlineContact::read()
{
    DynamicJsonDocument json(1024);
    json["state"] = analogRead(this->pin) == 1024;
    String data;
    serializeJson(json, data);
    return json;
}