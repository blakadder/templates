---
title: Meross MSS425
category: plug
type: Power Strip
standard: us
link: https://www.amazon.com/meross-Protector-Compatible-Assistant-Individually/dp/B07DXSJP8H
image: https://user-images.githubusercontent.com/5904370/54648572-1727f800-4aa7-11e9-9f92-c19a1045e70a.png
template: '{"NAME":"Meross MSS425","GPIO":[33,0,0,0,56,0,0,0,21,17,22,23,32],"FLAG":0,"BASE":18}'
---
To open, 4 screws are under the soft foot pads. They take a size 2.0 triangle bit; make sure you have a large collection of small screwdriver bits around.

![meross guts picture](https://raw.githubusercontent.com/hank/tasmota-contrib/master/2018-10-27-163303.jpg)

The programming header is directly on the Tuya module and is silkscreened with the labels for the pins. Solder onto those and program just like any other Tuya. There's unfortunately no button to get into firmware mode that I could find, so you have to ground the pin yourself. If you're using an external power source for the board and another power source for your TXD/RXD, make sure to tie the grounds together or else it won't talk. I burned on the generic tasmota release and set it up like so:

Relays 1-3 are the AC plugs
Relays 4,5 are the USBs
The button only turns off the first AC by default, but you could write rules to do whatever you want.

![tasmota config](https://raw.githubusercontent.com/hank/tasmota-contrib/master/Screenshot%20from%202018-10-27%2019-05-32.png)
