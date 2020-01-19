---
date_added: 2020-01-15
title: Techlife H4-E 15W E27/B22/E14 CW/WW
model: 
image: https://ae01.alicdn.com/kf/H1e2acfcc7ca8416584908f99857eb8a4m.jpg
link: https://www.aliexpress.com/item/4000126675875.html
link2: 
mlink: 
flash: SM02A
type: Bulb
---
This bulb uses "TechLife pro" app so its safe to assume other devices using the same app would not be compatible. 

### How to make it work?
With some desoldering and soldering action, you can replace the SM02A module with an ESP-M3 module ([Purchased here](https://cleanuri.com/K1Qjz8)). The bottom pins naturally drop into the three pins. While it is easier to simply solder TX, GND and VCC the TX pin goes high on boot and the bulb will always light up. Instead its better to route PWM to GPIO4 with a short wire (Don't forget to cut the TX pin short).

![Finished product](https://user-images.githubusercontent.com/5904370/72474499-2c65d400-37e9-11ea-8d75-280b33db330f.png)

Template used for PWM on GPIO4:
```erlang
{"NAME":"Techlife H4-E","GPIO":[0,0,0,0,37,0,0,0,0,0,0,0,0],"FLAG":0,"BASE":18}
```
### How to identify this device? 
If a listing sports images similar to this its the same device:

![listing image](https://ae01.alicdn.com/kf/H33bb8d22a04f4e11a6b9506f2e4026f9i.jpg)

#### Packaging
![Packaging](https://user-images.githubusercontent.com/5904370/72423383-75377180-3784-11ea-8576-268495d38414.png)

#### PCB and Wi-Fi Module
![Module](https://user-images.githubusercontent.com/5904370/72423554-c34c7500-3784-11ea-9ac9-918e354a48da.png)
