
#pragma once
#include <Arduino.h>
#include <FS.h>
#include <Ticker.h>
#include <libs/Relay/Relay.h>
#include <JC_Button.h>

#define REBOOT_BUTTON_DEFAULT_PIN D1
#define RESET_BUTTON_DEFAULT_PIN D2

#define STATUS_LED_DEFAULT_PIN D3
class HardwareButtons
{
private:
    Ticker rebootTicker;

    long buttonTimer = 0;
    long longPressTime = 250;

    boolean buttonActive = false;
    boolean longPressActive = false;
    Button *myBtn = new Button(REBOOT_BUTTON_DEFAULT_PIN);

public:
    HardwareButtons();
    void instantReset();
};