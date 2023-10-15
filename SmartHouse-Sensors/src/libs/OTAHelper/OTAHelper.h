#include <SPI.h>
#include <WiFiUdp.h>
#include <ArduinoOTA.h>

void initOTA(String networkName, String password = "", int port = 0)
{
    if (port != 0)
    {
        ArduinoOTA.setPort(port);
    }

    if (password != "")
    {
        ArduinoOTA.setPassword(password.c_str());
    }
    ArduinoOTA.setHostname(networkName.c_str());
    ArduinoOTA.onStart([]() {
        Serial.println("OTA Server begin");
    });
    ArduinoOTA.onError([](ota_error_t error) {
        switch (error)
        {
        case OTA_AUTH_ERROR:
            Serial.println("Authentication Error");
            break;
        case OTA_BEGIN_ERROR:
            Serial.println("Begin Error");
            break;
        case OTA_CONNECT_ERROR:
            Serial.println("Connect Error");
            break;
        case OTA_RECEIVE_ERROR:
            Serial.println("Receive Error");
            break;
        case OTA_END_ERROR:
            Serial.println("End Error");
            break;
        }
    });
    ArduinoOTA.onProgress([](unsigned int progress, unsigned int total) {
        Serial.printf("Progress: %u%%\r", (progress / (total / 100)));
    });
    ArduinoOTA.onEnd([]() {
        Serial.println("OTA End");
    });
    ArduinoOTA.begin();
}