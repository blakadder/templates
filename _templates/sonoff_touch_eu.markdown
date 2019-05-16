---
title: Sonoff Touch
category: switch
type: Switch
standard: eu
link: https://www.itead.cc/smart-home/sonoff-touch.html
image: https://user-images.githubusercontent.com/5904370/57885431-36cf6880-782b-11e9-9361-f4fa9f60fd80.png
template: '{"NAME":"Sonoff Touch","GPIO":[17,255,0,255,0,0,0,0,21,56,0,0,0],"FLAG":0,"BASE":10}' 
link_alt: 
---
Sonoff Touch is based on the ESP8285. Though the actual chip inside may be a [PSF-A85](https://www.itead.cc/wiki/PSF-A85).

## Serial Connection
Please see the [Hardware Preparation](https://github.com/arendst/Sonoff-Tasmota/wiki/Hardware-Preparation) page for general instructions.

Carefully remove the top PCB from the assembly. The hidden underside of the PCB contains the ESP8285 as shown in the pictures. 

<img title="Sonoff Touch EU version" src="https://github.com/arendst/arendst.github.io/blob/master/media/toucheu.jpg?raw=true" width="48%" align="right" />

Be careful while removing and reassembling the top PCB. The touch sensor should be back in its intended place, be sure to not touch it directly during the modifications.

The Sonoff Touch button is not connected to **GPIO0** and can not be used to bring the module into [flash mode](https://github.com/arendst/Sonoff-Tasmota/wiki/Hardware-Preparation#bringing-the-module-in-flash-mode). A connection between GPIO0 and GND needs to be made manually. GPIO0 can be found on the right side of the ESP8285 and is the second pin from the bottom, as marked on the image.

**Note:** Even if you have the PSF-A85 chip inside instead of a default ESP-8285, the GPIO0 pin is in the same location. Pay attention to the corner of the chip with three unused solder contacts. That is where the external antenna connector is located in the images above. The PSF-A85 in the Sonoff Touch does not have the external antenna connector soldered on.

## Official Sources
* Itead Product Page: http://sonoff.itead.cc/en/products/residential/sonoff-touch
* Itead Shop: https://www.itead.cc/sonoff-touch.html
* Itead Wiki: (na)

### Hardware modification for LEDs
Solder the switch LED where the Wifi LED is and then you can control the LED when you use the command Ledpower ON.
The Switch LED is on all the time, even when the switch is off
So you can easy see and find the switch in the dark

![](https://user-images.githubusercontent.com/47263019/52157768-158aa800-2692-11e9-8266-6775fec80c11.jpg)

Or you can solder the switch LED on 3.3v and ground
but then you cant control the LED, it is always on and very bright

![](https://user-images.githubusercontent.com/47263019/52159715-7d4bed80-26a8-11e9-8ed5-8a21dda1e349.jpeg)
![](https://user-images.githubusercontent.com/47263019/52159716-8046de00-26a8-11e9-83fc-7334679b620a.jpeg)

