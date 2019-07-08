---
title: Sonoff Basic
category: relay
type: Relay
standard: global
link: https://sonoff.itead.cc/en/products/sonoff/sonoff-basic
image: https://user-images.githubusercontent.com/5904370/57875590-99b50580-7813-11e9-86fa-73ce736467e6.png
template: '{"NAME":"Sonoff Basic","GPIO":[17,255,255,255,255,0,0,0,21,56,255,0,0],"FLAG":0,"BASE":1}' 
link_alt: 
---
Sonoff Basic - the one that started it all!

## Serial Flashing

Please see the [Hardware Preparation](https://github.com/arendst/Sonoff-Tasmota/wiki/Hardware-Preparation) page for general instructions.

<img alt="Sonoff Basic connection diagram" src="https://user-images.githubusercontent.com/2870104/30516551-ed12d69e-9b42-11e7-8373-1bfbbf346839.png" width="50%" align="right" />

You need to access the serial interface. The **four serial pins** (3V3, Rx, Tx, GND) are available in the middle of the PCB, right next to the on-board button. Newer version of the Sonoff module provide five pins below the button, ignore the pin furthest away from the Button (GPIO14 or I02) if available. The square pin right next to the button is the 3.3V line.

For flashing the sonoff basic V1.1, please hold the button while connecting the Plus Pole. The LED remains off until the flashing process is done and the board is rebooted.

The Sonoff Basic switch doesn't have memory to support all of the default services defined in user_config.h out of the box. If your switch is powering up but is showing a solid-blink-reset pattern see [this FAQ entry for advice.](https://github.com/arendst/Sonoff-Tasmota/wiki/Troubleshooting#running-out-of-memory)

## Sonoff Basic R3
This is the board layout for the third design iteration of the Sonoff Basic.
![](https://user-images.githubusercontent.com/34340210/60516116-13615f80-9cab-11e9-914b-d9509d6bbe20.jpg)

The Sonoff Basic R3 uses the ESP8255 chip. With this version, the mains power reverts to solder rails directly on the PCB. It also moves the Wi-Fi module to a separate PCB mounted on the main PCB. It makes access to the underside of the serial interface contacts quite difficult.

This version of the device supports the new Itead DIY architecture which [allows OTA firmware upload](https://www.youtube.com/watch?v=fRS-ukCgD_I). The process for performing an OTA update requires access to a jumper on the PCB (i.e., inside the case) and further Wi-Fi hotspot and app configuration. The device was reviewed by DigiblurDIY in [this video](https://www.youtube.com/watch?v=A-WcIz47Lco).

The serial interface pins are broken out on the PCB making flashing using a serial adapter considerably simpler than the Itead OTA process. Since the underside of the contacts is not easily reachable, use a solderless solution (i.e., friction) to maintain contact with the pins to flash the device.

### Sonoff Basic R2
Around November 2018, Itead changed the layout of the Sonoff Basic ([issue #4515](https://github.com/arendst/Sonoff-Tasmota/issues/4515)). The new board is labeled as **Sonoff RF R2 POWER V1.0**. Easily discerned from previous revisions by since its using wires instead of thick solder traces for mains power.

The new version of Sonoff Basic uses an ESP8285 SoC.

GPIO14 is no longer broken out to a contact on the PCB. Instead you can use GPIO2 labeled as `IO2` on the board. _**Take care that GPIO2 is not being pulled low when the device is booting**_. Otherwise, the device will not boot into its regular operational mode. 

Alternatively, you can use [use GPIO3](https://www.youtube.com/watch?v=yavDqDzRdUk) which does not have any boot function restrictions. However, both of these GPIO are pulled high momentarily after boot. This means that any connected device may "blink" when the Sonoff is powering up.

Unlike GPIO3, the GPIO2 PCB contact is not prepared for a pin. You will need to solder your cable directly on the board. Be careful. Too high a temperature or long heating can damage the contact and its connectivity. You should also make sure that there is no tension on the cable. Affix the cable with a cable tie and perhaps some hot glue.

* GPIO0 = BUTTON
* GPIO2 = IO2 (no pullup)
* GPIO12 = RELAY
* GPIO13 = LED1

> GPIO2 as a user configurable input is implemented in Sonoff Basic module since 6.3.0.15.

[<img src="https://camo.githubusercontent.com/7ee22f14cc707c04fa8ac357e4dd2a05da63852e/68747470733a2f2f7331352e64697265637475706c6f61642e6e65742f696d616765732f3138313132382f76653971673936382e6a7067" width="200" alt="label">
](https://camo.githubusercontent.com/7ee22f14cc707c04fa8ac357e4dd2a05da63852e/68747470733a2f2f7331352e64697265637475706c6f61642e6e65742f696d616765732f3138313132382f76653971673936382e6a7067)
[<img src="https://raw.githubusercontent.com/reloxx13/reloxx13.github.io/master/media/tasmota/sonoff-basic-r2/front.jpg" width="200" alt="front">](https://raw.githubusercontent.com/reloxx13/reloxx13.github.io/master/media/tasmota/sonoff-basic-r2/front.jpg)
[<img src="https://raw.githubusercontent.com/reloxx13/reloxx13.github.io/master/media/tasmota/sonoff-basic-r2/back.jpg" width="200" alt="back">](https://raw.githubusercontent.com/reloxx13/reloxx13.github.io/master/media/tasmota/sonoff-basic-r2/back.jpg)
[<img src="https://raw.githubusercontent.com/reloxx13/reloxx13.github.io/master/media/tasmota/sonoff-basic-r2/chip.jpg" width="200" alt="chip">](https://raw.githubusercontent.com/reloxx13/reloxx13.github.io/master/media/tasmota/sonoff-basic-r2/chip.jpg)

As an alternative to GPIO14 you can remove the bi-colour LED and use GPIO13 as input

![use gpio13](https://user-images.githubusercontent.com/47423730/52523999-1c1fad80-2c98-11e9-9b86-f50d82ff18cc.jpg)

You can remove the thick wires from the PCB to use the screw connection on the output side for low voltage. Then add a screw terminal next to the relay for the LINE OUT. This keeps all high voltage on one side of the board

## Sonoff Basic R1
This is the board layout for first board version of Sonoff Basic.

![gpios](https://cdn.instructables.com/F8Q/0U89/J1WEQK7J/F8Q0U89J1WEQK7J.MEDIUM.jpg)
_(Image re-used from https://www.instructables.com/id/Use-Homie-Firmware-to-Drive-Sonoff-Switch-Module-E/ Thanks @amayii0)_

* GPIO 03 - RX PIN
* GPIO 01 - TX PIN
* GPIO 04 - Second image (must solder wire to pin on ESP chip)
* GPIO 14 - Below GND PIN

![pinout](http://tinkerman.cat/wp-content/uploads/2016/06/pinout_back.jpg)

![gpio 14](http://evertdekker.com/wp/wp-content/gallery/sonoff/p1010285.jpg)

## Official Sources
* [Itead Product Page](http://sonoff.itead.cc/en/products/sonoff/sonoff-basic)
* [Itead Shop](https://www.itead.cc/sonoff-wifi-wireless-switch.html)
* [Itead Wiki](https://www.itead.cc/wiki/Sonoff)






