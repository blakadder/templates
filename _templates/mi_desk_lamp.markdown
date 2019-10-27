---
title: Mi LED Desk Lamp MJTD01YL
category: light
type: Light
standard: global
link: https://www.mi.com/global/smartlamp/
image: https://user-images.githubusercontent.com/5904370/58196142-e98b4500-7cc9-11e9-9bf0-453d5013fd6c.png
template: '{"NAME":"Mi Desk Lamp","GPIO":[0,0,17,0,37,38,0,0,150,151,0,0,0],"FLAG":0,"BASE":66}' 
link_alt: https://www.gearbest.com/table-lamps/pp_363779.html
---
**If you use a precompiled binary post version 6.5.0.5 this template will not work!**

As of Tasmota version 6.5.0.5 this device requires a self compiled version of Tasmota with the flag [`#define ROTARY_V1`](https://github.com/arendst/Tasmota/blob/82f16413d4ad8fe29ccf7e32b04e830ad316f030/sonoff/my_user_config.h#L399) in `my_user_config.h` uncommented. 


## Serial Flashing
You can open the lamp by unscrewing the three screws at the bottom of the lamp (under the rubber feets). The main pcb should look like this:

![PCB](https://github.com/fvollmer/open-desk-lamp-firmware/raw/master/img/pcb-labeled.jpg)


Solder Connections to U0RX, U0TX, GPIO0 and GND on main PCB.

Connect U0RX, U0TX and GND to USB serial adapter, pull GPIO0 to GND.