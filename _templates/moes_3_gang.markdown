---
date: 2019-04-08
title: Moes 3 Gang 
category: switch
type: Switch
standard: us
link: https://www.amazon.com/Wireless-Anywhere-Compatible-Function-Required/dp/B07BM1JJDC
image: https://images-na.ssl-images-amazon.com/images/I/41LEqcVVgZL._SX679_.jpg
template: '{"NAME":"Tuya Moes 3 Ch","GPIO":[27,255,26,18,22,19,0,0,17,21,25,23,24],"FLAG":0,"BASE":18}' 
link_alt: https://www.ebay.com/itm/F-ALEXA-Google-Home-APP-3Gang-WiFi-Smart-Panel-Touch-Switch-Remote-Control-Touch/132661136526
---

Relays and Status LED are not connected on the same GPIO's so I have considered them as a Relay and used rules to have them work as one.

Power1 --> Relay1 and Power4 --> LED1

Power2 --> Relay2 and Power5 --> LED2

Power3 --> Relay3 and Power6 --> LED4

Power7 --> WIfi LED

Rules: 
```
Rule1 on power1#state do power4 %value% endon on power2#state do power5 %value% endon on power3#state do power6 %value% endon on power6#state do power3 %value% endon on power5#state do power2 %value% endon on power4#state do power1 %value% endon
```
```
Rule1 1
```

