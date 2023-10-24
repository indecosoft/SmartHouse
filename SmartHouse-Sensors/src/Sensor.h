#pragma once
#include <ArduinoJson.h>

class Sensor
{
public:
    // virtual String read() {}
    virtual DynamicJsonDocument read();
    virtual void changeState(int) {}
};
