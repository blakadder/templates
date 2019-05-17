---
title: Obi Stecker
category: plug
type: Plug
standard: eu
link: https://www.obi.de/hausfunksteuerung/wifi-stecker-schuko/p/2291706
image: https://user-images.githubusercontent.com/5904370/57953956-cdfef380-78f1-11e9-9a69-37609bec9cee.png
template: '{"NAME":"OBI Socket","GPIO":[255,255,0,255,52,21,0,0,54,255,17,0,255],"FLAG":1,"BASE":51}' 
link_alt: 
---
## Serial Flashing
Opening the socket is kind of difficult. If you have one of the [Tri-Wing screwdrivers](https://www.amazon.de/dp/B00154ZYV0/ref=asc_df_B00154ZYV057501798/?tag=googshopde-21&creative=22398&creativeASIN=B00154ZYV0&linkCode=df0&hvadid=214366492459&hvpos=1o1&hvnetw=g&hvrand=5060839556356521171&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9044260&hvtargid=pla-420556387190&th=1&psc=1)
it is much more easier. If you haven't got use a normal head screwdriver. Be careful not damaging your hand with it.
> Tip: Afterwards use normal cross screws to close the casing.

```
| ESP | Programmer |
|-----|------------|
| VCC | 3V3        |
| TX  | RX         |
| RX  | TX         |
| GND | GND        |
```
Connect GPIO0 to GND before connecting power to enable flash mode!

### Additional Information
A low pulse on GPIO12 switches the relay on, a low pulse on GPIO5 switches it off.  
I have solved the 'pulse issue' by setting GPIO12 to always 0 (as LED) and works fine.   
More Infos can be found here: [#1988](https://github.com/arendst/Sonoff-Tasmota/issues/1988).

### Initial Configuration
In the default configuration GPIO0 (which is also used to enable flash-mode) is setup as a Button.  
To enable AP-Mode and setup the correct GPIOs as described below,  
You can short GPIO0 to GND 4 times as if it was a button (see [[Button-usage]])  
Using this method allows you to flash a precompiled binary.
   
### Device Images
![1](https://raw.githubusercontent.com/reloxx13/reloxx13.github.io/master/media/tasmota/obi-socket/1.jpg)  
![2](https://raw.githubusercontent.com/reloxx13/reloxx13.github.io/master/media/tasmota/obi-socket/2.jpg)  
![3](https://raw.githubusercontent.com/reloxx13/reloxx13.github.io/master/media/tasmota/obi-socket/3.jpg)  
![4](https://raw.githubusercontent.com/reloxx13/reloxx13.github.io/master/media/tasmota/obi-socket/4.jpg)  
![5](https://raw.githubusercontent.com/reloxx13/reloxx13.github.io/master/media/tasmota/obi-socket/5.jpg)     
(images from https://github.com/martin-ger/ESP8266-WiFi-Socket)  

