# Familia SmartHouse



# RPI configuration

Begin with a clean install of the latest release of a supported Linux distribution. In the example below, Raspberry Pi OS (64-bit) Lite is used. Update your OS to its latest version, including the kernel and firmware, followed by a reboot:

```bash
 sudo apt-get update
 sudo apt-get full-upgrade
 sudo reboot
```

Set the WiFi country in raspi-config's Localisation Options:
```bash
sudo raspi-config
```
Invoke RaspAP's Quick Installer:

```bash
curl -sL https://install.raspap.com | bash
```

Following a reboot, the wireless AP network will be configured as follows:

```
IP address: 10.3.141.1
Username: admin
Password: secret
DHCP range: 10.3.141.50 — 10.3.141.254
SSID: raspi-webgui
Password: ChangeMe
```
Update the Wi-Fi credentials to the following values

```
ssid: house
psk: house123456789
```

[More details here](https://raspap.com/#quick)


