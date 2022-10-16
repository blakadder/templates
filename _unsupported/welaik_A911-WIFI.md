---
date_added: 2021-02-06
title: Welaik 1 Gang 
model: A911-WIFI
image: /assets/device_images/welaik_A911-WIFI.webp
link: https://www.aliexpress.com/item/1005001597644005.html
link2: 
mlink: 
chip: WB3S
category: unsupported
type: Switch
---
Flash a ESP-12F module with Tasmota. Then replace the module (WB3S) for a ESP-12F.  The WB3S module is located on the back of the touch sensor PCB. Remove with care with low temperature air/soldering iron (ca. 200°C).
Make sure the touch sensor does not melt!

Template
```json
'{"NAME":"Welaik A911-WIFI 1gang","GPIO":[576,0,0,0,0,0,0,0,32,224,320,0,0,0],"FLAG":0,"BASE":1}' 
```