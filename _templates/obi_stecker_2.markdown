---
title: Obi Stecker 2
category: plug
type: Plug
standard: eu
link: https://www.obi.de/hausfunksteuerung/wifi-stecker-schuko-2-stueck-weiss/p/4077673
image: https://user-images.githubusercontent.com/5904370/57955953-97c47280-78f7-11e9-85bf-3288acd4fb7f.png
template: '{"NAME":"OBI Socket 2","GPIO":[0,0,0,0,21,17,0,0,56,53,0,0,0],"FLAG":0,"BASE":61}' 
link_alt: 
---
***Supported since version [6.4.1.8](https://github.com/arendst/Sonoff-Tasmota/issues/4829) as OBI Socket 2 (61)***

Another cheap socket from the German Hardware Store, based on ESP-WROOM-02 with 2MB Flash. Smaller form factor as the first OBI Socket. 

## Serial Flashing
One way to flash the module is soldering 4 wires to the RX/TX/3V3/GND pins from the ESP. The PCB has no serial pinout connector. For flashing the module enable the flash mode of the ESP, connect GPIO 0 to GND.

Another way to flash is soldering 4 wires to the bottom side of the PCB as described on https://github.com/mattzzw/obi_socket/wiki/OBI-socket. If you follow that approach of powering the socket with 5V (which enables the relay coil allowing for acoustic feedback) you need to make sure to nevertheless use 3V3 for the actual serial interface to the module!!! This happens to work out very nicely with the popular cheap CH340 USB to Serial TTL adapters which come with a jumper to select between 5V and 3.3V. Setting the adapter to 3.3V by putting the jumper on the 3V3 and VCC pins leaves the 5V pin free. That pin is directly connected to the USB port. So you can just connect the four wires from the socket to the four free pins of the CH340 adapter :-)

***
**_!!! DO NOT try to flash the module when it is connected to mains power. You WILL brick or destroy the device and your computer or USB Port. Use only a 3.3V USB adapter for flashing!!!_**

***

If you want the green wifi led to work, please use version 6.4.1.8+. You can either use "Obi Socket 2 Type (61)" (with default behaviour "wifi led = off" when connected) or use "Generic (18)" for manually override. See https://github.com/arendst/Sonoff-Tasmota/issues/4567 for details.

## PCB serial pinouts
![PCB](https://user-images.githubusercontent.com/43306023/49151886-7e137c80-f311-11e8-99d6-c51c55699d9d.JPG)
## PCB serial pinouts (back)
![image37071](https://user-images.githubusercontent.com/947665/54786666-bd037000-4c29-11e9-9ff4-9d6fd0b78a98.png)
( Note: Same PCB as OBI Socket IP44 (Black) ) 