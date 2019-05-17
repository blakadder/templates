---
date: 2019-02-28
title: Kuled KS602S
category: switch
type: Switch
standard: us
link: https://www.amazon.com/Required-Wireless-Requires-Schedule-Compatible/dp/B079FDTG7T
image: https://user-images.githubusercontent.com/5904370/53685150-53253400-3d17-11e9-9dbb-0c868db95e11.png
template: '{"NAME":"KULED","GPIO":[9,255,255,255,255,255,255,255,21,56,255,255,255],"FLAG":0,"BASE":18}'
link_alt:
---
Easily flashable with Tuya Convert 

## Serial flash
Some revisions of the switch have the header marked GND, RXD, TXD, 3V3. Some revisions do not.  It has been reported that some boxes have mixed revisions.  If you are ever in doubt, double check with a meter to determine your pins.  Flashing process and hardware revision without the labels can be seen on the following [video link](https://www.youtube.com/watch?v=4nX90vhAniQ).

![](https://github.com/lvgeek/KS-602S/blob/master/images/IMG_0282.jpg)
![](https://github.com/lvgeek/KS-602S/blob/master/images/IMG_0285.jpg)
![](https://github.com/lvgeek/KS-602S/blob/master/images/IMG_0286.jpg)
![](https://github.com/lvgeek/KS-602S/blob/master/images/IMG_0287.jpg)

RXD is connected to Transmit on your programmer
TXD is connected to Receive on your programmer
Ground and 3.3vdc to power unit during flash.

You do not need to solder a header to flash the board, an empty 4 pin header connected to 4 dupont jumper wires held into the empty header location works fine with a little pressure to ensure connectivity.

![](https://github.com/lvgeek/KS-602S/blob/master/images/IMG_0289.jpg)

Hold the button(GPIO0) and plug in programmer.

![](https://github.com/lvgeek/KS-602S/blob/master/images/IMG_0298.jpg)
