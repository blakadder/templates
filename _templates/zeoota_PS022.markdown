---
date_added: 2019-03-24
title: Zeoota PS022
category: plug
type: Power Strip
standard: eu
link: https://www.aliexpress.com/item/Smart-Wifi-Power-Strip-Surge-Protector-Multiple-Power-Sockets-4-USB-Port-Voice-Control-for-Amazon/32864068545.html
image: https://ae01.alicdn.com/kf/HTB1ejchXUzrK1RjSspmq6AOdFXaS/Smart-Wifi-Power-Strip-Surge-Protector-Multiple-Power-Sockets-4-USB-Port-Voice-Control-for-Amazon.jpg
template: '{"NAME":"ZEOOTA 3x plus","GPIO":[0,57,0,56,22,21,0,0,17,23,24,0,0],"FLAG":1,"BASE":18}'
link_alt:
---

Button controls single relay only. To switch other relays use rules.

E.g. all other relays synchronized to relay 1:
```
rule on Power1#boot do var1 %value% endon on Power1#state do var1 %value% endon on button1#state do event change=%var1% endon on event#change==0 do backlog POWER1 1; POWER2 1; POWER3 1; POWER4 1 endon on event#change==1 do backlog POWER1 0; POWER2 0; POWER3 0; POWER4 0 endon
```
