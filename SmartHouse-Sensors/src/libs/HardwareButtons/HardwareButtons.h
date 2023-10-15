#pragma once
#include <libs/HardwareButtons/HardwareButtonsDefinition.hpp>
#include <libs/WiFiConfig/Wifihelper.h>

HardwareButtons::HardwareButtons()
{
    myBtn->begin();

    rebootTicker.attach(0.1, [&]() {
        myBtn->read();
        if (myBtn->wasReleased())
        {
            Serial.println("Sensor will reboot now.");
            // delay(500);
            WiFi.stopSmartConfig();
            ESP.restart();
        }
        else if (myBtn->pressedFor(5000))
        {
            WiFi.stopSmartConfig();
            digitalWrite(STATUS_LED_DEFAULT_PIN, LOW);
            Serial.println("Sensor will reset now.");
            SPIFFS.remove("/config.json");
            auto ticker = new Ticker();
            ticker->once(5, []() {
                digitalWrite(STATUS_LED_DEFAULT_PIN, HIGH);
                ESP.reset();
            });
        }
    });

    Serial.println("Sensor initialized");
}
void HardwareButtons::instantReset()
{
    WiFi.stopSmartConfig();
    digitalWrite(STATUS_LED_DEFAULT_PIN, LOW);
    Serial.println("Sensor will reset now.");
    SPIFFS.remove("/config.json");
    auto ticker = new Ticker();
    ticker->once(5, []() {
        digitalWrite(STATUS_LED_DEFAULT_PIN, HIGH);
        ESP.reset();
    });
}
