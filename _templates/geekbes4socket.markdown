---
title: Geekbes 4AC+4USB
category: plug
type: Power Strip
standard: eu
link: https://www.amazon.de/gp/product/B078W23BW9
image: https://images-na.ssl-images-amazon.com/images/I/51blfM-4LXL._SL1000_.jpg
template: '{"NAME":"Geekbes 4xStri","GPIO":[0,56,0,17,22,21,0,0,23,24,25,0,0],"FLAG":1,"BASE":18}
'
---
Button controls single relay only. To switch other relays:
```
rule on button1#state do backlog POWER1 toggle; POWER2 toggle; POWER3 toggle; POWER4 toggle; POWER5 toggle endon
```
