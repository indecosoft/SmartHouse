#pragma once
#include <Arduino.h>

#include <Ticker.h>

#include <libs/HardwareButtons/HardwareButtons.h>
#include <libs/Relay/Relay.h>

#include <ESPAsyncWebServer.h>
#include <DNSServer.h>
#include "AsyncJson.h"
#include <config.h>

class WiFiHelper
{
private:
    Sensor *relay;
    AsyncWebServer *webServer;
    HardwareButtons hardwareButtons;
    const int DNS_PORT = 53;
    IPAddress *apIP;
    DNSServer dnsServer;
    Ticker pairingModeTicker;
    Ticker webServerConfigTicker;
    String ssidName, password;
    Config *config = new Config();
    bool getSavedConfig();

public:
    WiFiHelper(Sensor *);
    void begin();
    void end();
    String server, port, freqMinutes;
};