---
title: SM-SO301
category: plug
type: Power Strip
standard: us
link: https://www.amazon.com/d/Surge-Protector-Power-Strips/Jinvoo-Protector-Outlets-Required-Google/B071ZGDDQG
image: https://user-images.githubusercontent.com/5904370/54648572-1727f800-4aa7-11e9-9f92-c19a1045e70a.png
template: '{"NAME":"SM-SO301","GPIO":[56,0,0,0,30,17,0,0,32,31,33,0,21],"FLAG":0,"BASE":18}'
link_alt: https://www.aliexpress.com/item/US-Fast-charging-USB-us-smart-socket-Amazon-ALEXA-Google-Google-sound-controllingAC110-240V/32857270070.html
---
SM-SO301 with an FCC ID of 2AJ5F-SM-SO3015 has 4 mains power and 4 USB ports.  Each mains power is independently controlled and the USB group is controllable via a solid state relay.
The ESP8266 module inside is a TYWE3S by Tuya. 

Model purchased SM-SO301 (it seems to change on Amazon and other places, search for the model#). Other resellers may sell the same unit with various mains voltages/plug types.

### Product 

![img_20180726_165744](https://user-images.githubusercontent.com/3240875/43303061-b5408f44-9133-11e8-959b-60cc6bf1d6ca.jpg)

### Flashing and Configuration Pictures

![tywe3s_3](https://user-images.githubusercontent.com/3240875/43324698-669affd6-917a-11e8-8e06-c800741bfb68.png)
![chip_wires](https://user-images.githubusercontent.com/3240875/43324672-578ffcbc-917a-11e8-800c-f1d008ca3cf4.JPG)

Hold/Attach the GPIO0 wire/pin to ground during initial boot to flash. (TX pin to RX pin and RX pin to TX pin on USB flash adapter)

![img_20180726_184232](https://user-images.githubusercontent.com/3240875/43303089-d1873a68-9133-11e8-9dbd-f5fd332050be.jpg)
![tas_power1](https://user-images.githubusercontent.com/3240875/43324706-6d14d972-917a-11e8-9be3-b6f6f4ef4dcf.JPG)

