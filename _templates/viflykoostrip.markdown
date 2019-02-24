---
name: Viflykoo 3AC+4USB
category: plug #use only (plug, switch, light, misc)
type: power strip
standard: eu
link: https://www.amazon.de/gp/product/B0779RF8NY
image: https://images-na.ssl-images-amazon.com/images/I/61cW9rz82dL._SL1000_.jpg
template: '{"NAME":"Viflykoo 3xStr","GPIO":[0,0,53,0,0,23,0,0,21,56,17,24,22],"FLAG":1,"BASE":18}
'
---
Button controls single relay only. To switch other relays use rules:
```
rule on button1#state do backlog POWER1 toggle; POWER2 toggle; POWER3 toggle; POWER4 toggle endon
```
