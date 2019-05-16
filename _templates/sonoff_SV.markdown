---
title: Sonoff SV
category: relay
type: Relay
standard: global
link: https://www.itead.cc/smart-home/sonoff-sv.html
image: https://user-images.githubusercontent.com/5904370/57877355-eef31600-7817-11e9-9812-393f47558adc.png
template: '{"NAME":"Sonoff SV","GPIO":[17,255,0,255,255,255,0,0,21,56,255,0,0],"FLAG":1,"BASE":3}' 
link_alt: 
---
Sonoff Safe Voltage is almost the same as Sonoff Basic R1.
These are the differences between the two:
* It can be powered by DC voltage
* It has extra GPIO pin headers
* It has two LED status lights (RED and GREEN)
* The traces on the bottom aren't soldered
* The GND, TX, RX and 3v3 pins are labeled 

| Usable GPIO pins  |
| ------------- |
| GPIO4 |
| GPIO5  | 
| GPIO14  | 

### ⚠️ What can the unit handle ⚠️
The trace is 2 mm wide. By assuming the PCB trace thickens is 1 oz/ft^2 you can calculate the current:2 A

If you are using more current be sure to put solder on the solder pad area.

# Using Sonoff SV
You can use the Sonoff SV in three different ways.

#### 1. Variable DC voltage between 5-24 V 
By not having the jumper connected in the far left. the voltage regulator is used for the relay.

#### 2. Solid DC voltage 5 V
By bridging the two pins you are connecting the 5 V input directly to the relay so you are bypassing the regulator so the relay still gets 5 V

#### 3. ⚠️ With AC voltage ⚠️ 

⚠️ ⚡️ **WARNING ONLY DO THIS WHEN YOU KNOW WHAT YOU ARE DOING.** ⚡️ ⚠️ 

By removing the two 0 ohm SMD resistors next to the jumper you are disconnecting the voltage input from the logic.
By doing this you can switch AC again like the Sonoff Basic.
Than You can use the jumpers labeled 5~12 V as your DC voltage for the ESP and relay. 

***

![](https://www.itead.cc/wiki/images/4/47/Sonoff_SV_mode.jpg)

![](https://i.imgur.com/ps8t37j.jpg)

## Official Sources

* Itead Product Page: 
* Itead Shop: https://www.itead.cc/sonoff-sv.html
* Itead Wiki: https://www.itead.cc/wiki/Sonoff_SV
