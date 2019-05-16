---
title: Sonoff T1 2 Gang
category: switch
type: Switch
standard: uk
link: https://www.itead.cc/smart-home/sonoff-t1.html
image: https://user-images.githubusercontent.com/5904370/57893156-22e33100-7842-11e9-8749-81db74dac23f.png
template: '{"NAME":"Sonoff T1 2CH","GPIO":[17,255,255,255,0,22,18,0,21,56,0,0,0],"FLAG":0,"BASE":29}' 
link_alt: 
---
## Known issues
* Tasmota firmware has functionality to perform special actions on multiple quick button presses and long press
  * This will cause the T1 board to reset if relay board is not connected, because long press on button 1 will be detected
  * These special functions probably do not make sense for a wall switch
  * To disable, use command [`SetOption13 1`](Commands#setoption13)
* When powered solely with 3.3v from the serial-to-USB adapter long press will be detected by Tasmota on Button1
* When powered solely with 3.3v from the serial-to-USB adapter RF functions do not work

## Serial Flashing
The front circuit board should be disconnected from the rear relay board to prevent power draw upsetting the flashing process. The unit must be powered up before attempting to enter programming mode. If touch Button1 is held while power is connected, the device will not go enter flash mode. The touch IC does not have time to recognise the key-press before the device boots.

#### Touch Board VER:1
The following board layouts are from the 3 variants of the Sonoff T1 UK variant and are marked Sonoff T1 R2 UK Touch Board, Ver 1.0. 

_[SonOTA](https://github.com/mirko/SonOTA) may work again [with Sonoff firmware v2.0.1 or greater](https://github.com/mirko/SonOTA/wiki#known-working-configurations). This needs to be verified for this specific device._

![img_20180113_094236](https://user-images.githubusercontent.com/10469147/34905168-6128981a-f84b-11e7-9cf0-e0e4c3b0bd55.jpg)

1. Entering Flashing mode varies between the 1, 2 and 3 channel versions. See the above picture for button nomenclature used. (The variations between the 3 versions appear to be managed by the touch IC rather than in the ESP).  
To enter flashing mode the unit should be powered and connected to the programmer of choice. Touch Button 1 should then be held while the reset button (4) is pressed. When the device reboots, Button 1 can be released.
OR
2. Double-press the reset-button

Try option 1 **OR** option 2. This will cause the unit to reboot into flash mode. This is confirmed on a serial console (74880 baud) by the boot mode displaying (1,x) indicating that we are booted to the bootloader and not the flash.  You can also confirm booted to flash without a serial console, the main led should be off and the backlight LEDs lit dimly.
There is no longer a need to solder anything to GPIO0 or to ground it while powering up for Ver1.0; this step is replaced by the above button sequence. However, GPIO0 to GND is the only way for Ver1.1 boards.
#### Touch Board VER:1.1
![](https://github.com/arendst/arendst.github.io/blob/master/media/SONOFF-T1-R2-UK-GPIO-PIN-OUTS.png?raw=true)
Notes:
1. There is not enough room with this reversion to fit a header pins on the programming port and still close the case.
2. GPIO0 is connected to the Helper chip on this version. Therefore, the only way to get Ver1.1 of the board into flash mode is to solder a lead onto the resistor R19 from pin 15 on the ESP chip (i.e., GPIO0) and connect this lead to GND on power up; the device will set all the touch pads to dim and the WiFi LED D3 will NOT be on at all.
3. Log on the J3 header is GPIO2

**WARNING!!** Do not attempt to power the device from your serial-to-USB adapter when connected to the relay board. This draws too much power and will cause the ESP to reboot frequently and will reset all the configured settings.

## Official Sources

* [Itead Product Page](http://sonoff.itead.cc/en/products/residential/sonoff-t1)
* [Itead Shop](https://www.itead.cc/sonoff-t1.html)
* Itead Wiki: (na)
