---
date_added: 2019-03-11
title: Teckin SS30
category: plug
type: Power Strip
standard: us
link: https://www.teckinhome.com/copy-of-sp-23-1
image: https://images-na.ssl-images-amazon.com/images/I/51E21BTODPL._SL1001_.jpg
template: '{"NAME":"Teckin SS30","GPIO":[52,255,255,57,29,17,255,255,31,30,32,255,25],"FLAG":0,"BASE":18}' 
link_alt:  https://www.amazon.ca/dp/B07G179ZWS
---

July 20, 2019

https://github.com/arendst/Tasmota/issues/3343#issuecomment-513474906

The interior design of this device has changed. The ESP is not accessible with just taking the back panel off. The entire PCB must be removed (attached only with screws) in order to access the Tuya Wi-Fi module on the other side of the PCB.

[Tuya-Convert](https://github.com/ct-Open-Source/tuya-convert/blob/master/README.md) was still able to flash this revision of the device (i.e., the Tuya firmware had not been upgraded).

Oct 23, 2019

Changed GPIO16 from Led3i to Relay5. This allows the USB charging ports to be turned on and off.






