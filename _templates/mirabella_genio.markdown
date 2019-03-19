---
title: Mirabella Genio
category: plug
type: Plug
standard: anzac
link: https://www.kmart.com.au/product/mirabella-genio-wi-fi-1-usb-adaptor/2326810
image: https://user-images.githubusercontent.com/5904370/54647463-dded8900-4aa2-11e9-9b8a-7b9ef4fe2c23.png
template: '{"NAME":"Genio 1","GPIO":[0,0,56,0,0,0,0,0,21,17,0,0,0],"FLAG":0,"BASE":1}' 
link_alt: https://mirabellagenio.net.au/smart-adaptor
---
This is a simple smart plug with the addition of a USB port, as far as I can see the USB port  is 'always on' and is not access this from the ESP module.
Opening up the device was easy, 2 screws then a small amount of gentle prying exposed the components, 2 more screws had it fully deconstructed.

## Serial Flashing

The ESP module is mounted on a pcb with all of the required pins exposed.
 
![Photo of plug](https://i.ibb.co/FDk2TMz/genio-plug-connections-SM.jpg)
![ESP8266 PINOUT](https://i.ibb.co/YRQstXr/ESP-PIN-OUT.png)

I was able to flash by connecting GPIO0 to GND while connecting my Serial Adaptor and flashing as per any other ESP device 

[my prefered flashing method](https://www.youtube.com/watch?v=UDnNI5wkNNY)
