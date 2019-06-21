---
title: Witty Cloud
category: misc
type: Development Board
standard: global
link: https://www.aliexpress.com/af/witty-cloud.html?site=glo&g=y&d=y&origin=n&spm=2114.search0604.0.0.1e943181ijfCjr&filterCat=400103%2C153713&jump=afs&groupsort=1&SortType=price_asc&SearchText=witty+cloud&initiative_id=SB_20190517094810&isViewCP=y
image: https://user-images.githubusercontent.com/5904370/57946364-6b4f2d00-78dc-11e9-897c-0e5ec0d74860.png
template: '{"NAME":"Witty Cloud","GPIO":[255,255,56,255,17,255,0,0,38,39,255,37,255],"FLAG":1,"BASE":32}' 
link_alt: https://www.amazon.com/Sunhokey-ESP8266-Serial-Development-ESP-12F/dp/B07BRNQHC1
---

The "Witty Cloud Development Board" consists of two boards connected via two 8-pin headers: the ESP board and a serial board. For a detailed description see e.g. ["First Impression on ESP8266 Witty Cloud Board](https://yoursunny.com/t/2016/WittyCloud-first/).

## ESP8266MOD board pins
<img alt="ESP8266MOD board pins" src="https://github.com/Willi2006/templates/blob/master/ESP8266MOD%20board%20pins.jpg" width="50%" />
 

# Serial Flashing

There's no hardware preparation required.
On the ["Prerequisites"](https://github.com/arendst/Sonoff-Tasmota/wiki/Prerequisites) page skip the section "Needed Hardware" and follow the section "Needed Software". 

For using the LDR which is connected to the analog input "ADC", select the Tasmota firmware **sonoff-sensor.bin**. 
>"Currently the ESP8266 Analog input is enabled only in the sonoff-sensor firmware version. All other versions use it for voltage monitoring."< 
See: ["POLL: Disable USE_ADC_VCC for permanent Analog user input"](https://github.com/arendst/Sonoff-Tasmota/issues/5671). 

- Connect a micro USB cable to the serial board.
- Press and hold the "FLASH" button of the serial board.
- Connect the USB cable to the computer.
- After about 5 seconds release the "FLASH" button.
- Windows Device-Manager shows: **USB-SERIAL CH340 (COMx)**.
- Flash, e.g with Esptool executable on Windows to COMx.
- After flashing the blue LED is blinking.
- Disconnect the USB cable from computer and serial board.

# Initial Configuration

For this two methods are described: ["Initial Configuration"](https://github.com/arendst/Sonoff-Tasmota/wiki/Initial-Configuration) .

### "Using Web UI"

The two boards can be separated. The serial board isn't needed anymore. Initial Configuration and future flashing can be done over the air (OTA).

- Connect the micro USB cable to the ESP board: only power, no data connection.
- Connect the USB cable to a USB Port of the computer or a separate USB power supply or charger.
- ESP boots and is ready for ["Initial Configuration"](https://github.com/arendst/Sonoff-Tasmota/wiki/Initial-Configuration). 
- Configure as required.
- Select Configuration, Configure Module, Module type: **Witty Cloud (32)**.

### "Using Serial Terminal"

- Connect the micro USB cable to the serial board: power and data connection.
- Connect the USB cable to a USB Port of the computer.
- ESP boots and is ready for ["Initial Configuration"](https://github.com/arendst/Sonoff-Tasmota/wiki/Initial-Configuration). 

# Web UI

The Web UI is shown after saving the configuration and rebooting:

<img alt="Witty Cloud Module Web User Interface" src="https://github.com/Willi2006/templates/blob/master/Witty%20Cloud%20Module%20Web%20User%20Interface.jpg" width="30%" />
 
- "Analog0" = [1..1024} - analog reading from the LDR 

- Slider - RGB LED

- Toggle - toggle switch for Power on or off.

# Simple rule example: twilight switch

This example uses only the ESP board, no additional hardware required.

Inital configuration on console:

- `Backlog Rule1 1; Rule 4; poweronstate 0` 
- (turn on rule 1; turn off one-shot rule; start all relays off)

Rule on console, to switch blue LED:

- `Rule1 on Analog#A0div10<8 do power 1 endon on Analog#A0div10>10 do power 0 endon`
- (If LDR value less than 8% power on blue LED. If LDR value greater 10% switch off blue LED.)

Rule on console, to switch RGB LED color red (channel1):

- `Rule1 on Analog#A0div10<8 do channel1 50 endon on Analog#A0div10>10 do channel1 0 endon`
- (If LDR value less than 8% RGB LED red 50%. If LDR value greater 10% RGB LED red 0%.)

