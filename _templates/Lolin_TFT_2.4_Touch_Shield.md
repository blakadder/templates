---
date_added: 2021-12-11
title: Lolin TFT 2.4 Touch Shield 
model: TFT-2.4 v1.1.0
category: diy
type: Display
standard: global
image: /assets/images/tft_2.4_v1.0.0_1_16x16.jpg
template: '{"NAME":"Lolin TFT 2.4 Touch Shield","GPIO":[6784,224,225,226,1,992,1,1,672,704,736,5920,5888,1],"FLAG":0,"BASE":18}' 
mlink: https://www.wemos.cc/en/latest/d1_mini_shield/tft_2_4.html
link: https://nl.aliexpress.com/item/32919729730.html
link2: https://www.tinytronics.nl/shop/en/displays/tft/wemos-2.4-inch-tft-shield-for-d1-mini-with-touchscreen
---

## How this was tested
- TFT-2.4 v1.1.0
- [Tasmota v10.1.0](https://github.com/arendst/Tasmota/releases/tag/v10.1.0)
- [Lolin D1 Mini v3](https://nl.aliexpress.com/item/32831353752.html) with 4MB flash
- Legs soldered on D1 Mini
- D1 Mini directly on the back of the TFT shield, make sure you line up pins correctly
- Don't forget to enable the template using **Configuration > Configure Module**
- The last **Toggle** button in the Tasmota web interface can be used to enable/disable the display

## Custom Build
To use all features of this touch shield, you will need to do a [custom build](https://tasmota.github.io/docs/Compile-your-build/) with these settings in `tasmota/user_config_override.h`:
```
#define USE_SPI
#define USE_DISPLAY
#define USE_DISPLAY_ILI9341
#define USE_XPT2046
#define USE_TOUCH_BUTTONS
#define USE_UFILESYS   // Required for USE_TOUCH_BUTTONS to work
#define USE_SCRIPT
#undef USE_RULES
```
I used `platformio run -e tasmota` to build (MacOS or Linux), and [Tasmotizer](https://github.com/tasmota/tasmotizer) to flash.

## Configure Display
In the Tasmota web interface paste in **Consoles > Console**:
```
Backlog DisplayMode 0; DisplayRows 40; DisplayCols 34; DisplayRotate 0; DisplayWidth 240; DisplayHeight 320; DisplayFont 1;
```

## Script for buttons
In the Tasmota web interface go to **Consoles > Edit Script**

Enable the checkbox **Script enable**

Paste this script:
```
>D
>B
->DisplayReinit
dt [B1C63488x45y15f2]Lolin TFT
dt [b0:20:60:200:60:10:10:1:3:Relay 1:]
dt [b1:20:140:200:60:10:10:1:3:Relay 2:]
dt [b2:20:220:200:60:10:10:1:3:Relay 3:]
```
Click **Save**

These `dt` lines are in fact [DisplayText](https://tasmota.github.io/docs/Displays/#displaytext) commands, the `b0`,`b1`,`b2` create [touch buttons](https://tasmota.github.io/docs/Displays/#touch-buttons-and-sliders). The numbers define position, size and colors.  

## Result
The buttons will switch the configured relays without any extra scripting or configuration.
![Lolin TFT 2.4 Touch Demo](assets/images/lolin_tft_2.4_demo.png?raw=true "Lolin TFT 2.4 Touch Demo")
