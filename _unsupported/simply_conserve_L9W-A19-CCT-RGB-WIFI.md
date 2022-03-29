---
date_added: 2022-01-09
title: Simply Conserve A19 9W  
model: L9W-A19-CCT-RGB-WIFI
image: /assets/images/simply_conserve_L9W-A19-CCT-RGB-WIFI.jpg
template9: '{"NAME":"L9W-A19-CCT-RGB-WIFI","GPIO":[1,0,1,0,417,416,0,0,420,418,419,0,0,0],"FLAG":0,"BASE":18}' 
link: https://simplyconserve.com/a19-smart-led-standard-bulb/
link2: 
mlink: https://simplyconserve.com/a19-smart-led-standard-bulb/
flash: serial
category: bulb
type: RGBCCT
standard: e27
chip: TYWE2L
---
The bulb is Tuya-based but the samples I received shipped with a new firmware that is not yet compatible with tuya-convert. I had to pop the top plastic off (easily done), unscrew and remove the LED board (easily done), pull out the live contact from the bottom of the bulb, reach in with a tool to break off the neutral wire (a struggle), then slide out the board, desolder the Tuya TYWE2L module and use the serial port on the back of the Tuya module to flash over serial. Then I repeated the whole process in reverse to reassemble the bulb (I extended the neutral wire so I could more easily solder it while the board was not yet fully seated.) Board photos at https://photos.app.goo.gl/5JteUgd22K4KLzwn7
