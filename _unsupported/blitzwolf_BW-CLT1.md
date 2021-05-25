---
date_added: 2021-05-15
title: BlitzWolf RGB Atmosphere and CCT
model: BW-CLT1
image: /assets/images/blitzwolf_BW-CLT1.jpg
link: https://www.banggood.com/BlitzWolf-BW-CLT1-LED-Smart-Ceiling-Light-with-Main-Light-and-RGB-Atmosphere-Light-2700-6500K-Adjustable-Temperature-APP-Remote-Control-Optional-and-DIY-Scene-Mode-p-1793809.html
link2: 
mlink: 
flash: WB3L
category: unsupported
type: Ceiling Light
standard: eu
---
Unfortunately the device used a WB3L module. Fortunately it's pin-compatible with ESP-12F or ESP-07. Use one of them, flash it and replace the original WB3L to this one.

The pull up resistors required in GPIO0 and CH_EN and pull down GPIO15.

Working template:
```console
{"NAME":"BW-CLT1","GPIO":[0,0,0,0,419,0,0,0,418,420,417,416,0,0],"FLAG":0,"BASE":18}
```

Suggested option: `SetOption37 128`

[Useful link](https://hackaday.com/2021/04/17/replacing-an-esp8266-clone-with-the-real-thing/)

