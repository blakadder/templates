---
title: PS-16-DZ
category: switch
type: Dimmer
standard: us
link: https://www.amazon.ca/Switch-Dimmer-Electrical-Control-Twharf/dp/B07DZX5685
image: https://user-images.githubusercontent.com/5904370/57955818-2389cf00-78f7-11e9-99ef-2fecf3a18fc7.png
template: '{"NAME":"PS-16-DZ","GPIO":[255,148,255,149,255,255,0,0,255,52,255,255,255],"FLAG":0,"BASE":58}' 
link_alt: 
---
The [PS-16-DZ](http://www.ihome-s.com/productinfo/448320.html) dimmer uses eWeLink app same as Sonoff devices. 

Opened it up, found a ESP8285 and a Nuvoton N76E003.
![](https://user-images.githubusercontent.com/34905120/45901464-ff4e1080-bdb0-11e8-8a35-0bbea810b0b9.jpg)
![](https://user-images.githubusercontent.com/34905120/45901474-0543f180-bdb1-11e8-9d1e-e9ab815d4e20.jpg)
![](https://user-images.githubusercontent.com/34905120/48847747-44ba9a00-ed70-11e8-9e92-957a3ed1bf41.jpg)

## Serial Flashing
Remove the ESP8285 daughter card DLX-MKCK01 from the main board and flash Tasmota.
```
pin1 RST -> N76E003 P0.5/PWM2
pin2 TXD -> N76E003 P0.7/RXD
pin3 RXD -> N76E003 P0.6/TXD
pin4 GPIO13/MTCK -> LED
pin5 3.3V
pin6 GND
```
## Communication between ESP8285 and N76E003
It uses AT command to communicate between ESP8285 and N76E003 over UART at 19200 baud.
```
Turn on the switch from ESP8266:
Send from ESP8266
AT+UPDATE="sequence":"1528335040032","switch":"on"
Receive from MCU
AT+RESULT="sequence":1528335040032"
Send from ESP8266:
AT+SEND=ok
After 0.7s
Receive from MCU
AT+UPDATE="switch":"on","bright":44
Send from ESP8266:
AT+SEND=ok

Turn off the switch from ESP8266:
Send from ESP8266
AT+UPDATE="sequence":"1528335118327","switch":"off"
Receive from MCU
AT+RESULT="sequence":1528335118327"
Send from ESP8266:
AT+SEND=ok
After 0.7s
Receive from MCU
AT+UPDATE="switch":"on","bright":44
Send from ESP8266:
AT+SEND=ok

Change brightness to 44 from ESP8266:
Send from ESP8266:
AT+UPDATE="sequence":"1528335181502","bright":44
Receive from MCU
AT+RESULT="sequence":1528335181502"
Send from ESP8266:
AT+SEND=ok
After 0.7s
Receive from MCU
AT+UPDATE="switch":"on","bright":44
Send from ESP8266:
AT+SEND=ok

Turn on the switch with faceplate button:
Received from MCU
AT+UPDATE="switch":"on","bright":44
Send from ESP8266:
AT+SEND=ok

Turn off the switch with faceplate button:
Received from MCU
AT+UPDATE="switch":"off","bright":44
Send from ESP8266:
AT+SEND=ok

Change the brightness to 52 with faceplate button:
Received from MCU
AT+UPDATE="switch":"on","bright":52
Send from ESP8266:
AT+SEND=ok

Holding the middle button on faceplate to reset the device:
Received from MCU
AT+SETTING=enterESPTOUCH
Send from ESP8266:
AT+SETTING=enterESPTOUCH
```
The sequence number is a 13 digits unix timestamp (in milliseconds). The data after "bright" is the brightness. The maximum of the brightness is 100 and the minimum is 10.
There is one byte 0x1B at the end of each AT command.

