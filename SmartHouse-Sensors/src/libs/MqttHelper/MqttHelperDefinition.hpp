#pragma once
#include <PubSubClient.h>
#include <libs/HardwareButtons/HardwareButtons.h>
#include <ESPAsyncWebServer.h>
#include <config.h>

class MqttHelper
{
private:
    Sensor *relay;
    HardwareButtons hardwareButtons;
    WiFiClient espClient;
    Ticker mqttTicker;
    String domain;
    IPAddress *server = new IPAddress();
    Config *config;
    int port;
    PubSubClient client = PubSubClient(espClient);

public:
    MqttHelper(Config *, Sensor *, int);

    ~MqttHelper();

    void initMqtt();
    void connect(String);
    bool isConnected();
    // bool registerModule();
    void publish(String, String);
};