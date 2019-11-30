---
date_added: 2019-03-03
title: LEDEnet
category: light
type: LED Controller
standard: us
link: https://www.amazon.com/gp/product/B01DY56N8U
image: https://images-na.ssl-images-amazon.com/images/I/61GJlcY3I0L._SL1000_.jpg
template: '{"NAME":"LEDEnet","GPIO":[0,255,56,255,147,0,0,0,38,39,37,40,0],"FLAG":0,"BASE":34}' 
link_alt: 
---
### Hardware Information (from esptool): 

- Chip is ESP8285
- Features: WiFi, Embedded Flash
- Auto-detected Flash size: 1MB

### Easily Accessible Serial Pins
![LEDEnet Controller Serial Pins](/templates/assets/images/led_enet_controller_serial.jpg)

### Serial Flashing / Hardware Configuration

The LEDEnet Controller has all of the serial IO pins broken out and labeled. Makes flashing very easy to do. 

However, the device does require some specific steps to get it to flash in the first place. 

It took forever to figure this out, but to flash/program it:
- Hold the button (by the LED) while applying power.
  - GPIO0 (center pad on back) doesn't matter at this point, ignore it for now. 
- The controller should be in "Flash Mode" now; but the LEDs (on the device) will still appear "normal". 
- Start the flashing process; I used the normal `sonoff.bin` file (516KB).
  - `sonoff.bin` worked fine on my version of the controller
  - `sonoff-classic.bin` might be required if there are size issues. 
  - `esp_1024` images also exist, they're all smaller than 512KB
- Command Line: `python3.6 -m esptool --port /dev/tty.usbserial-(xxxxx) write_flash 0x0 whatever.bin`
- Or use the excellent [NodeMCU PyFlasher](https://github.com/marcelstoer/nodemcu-pyflasher)
- After the flash succeeds, you'll need to take the lead you soldered to GPIO0 (labeled as IO on my board), and tap it to ground 4 times quickly. 
- This forces the controller to start broadcasting the configuration SSID (it might reset the controller, or something else, unsure my Serial cable didn't pick up any log messages)
- Now you can connect and enter your WiFI credentials

[Instructions Based on this Amazon Review](https://www.amazon.com/gp/customer-reviews/R380TIPJMY455A/ref=cm_cr_dp_d_rvw_btm?ie=UTF8&ASIN=B01DY56N8U#wasThisHelpful)

Credit to M. Holstein on Amazon. 
