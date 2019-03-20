---
date: 2019-03-19
title: CE Garden Power Stake
category: plug
type: Power Strip
standard: us
link: https://www.amazon.com/Wi-Fi-Smart-Outdoor-outlets-Compatible/dp/B07M83WG1J
image: https://user-images.githubusercontent.com/5904370/54647111-aaf6c580-4aa1-11e9-8da2-fab79ef32e4e.png
template: '{"NAME":"CE Power Stake","GPIO":[0,0,0,0,56,57,0,0,21,17,0,0,0],"FLAG":0,"BASE":18}'
alt_link: https://www.ebay.com/itm/CE-Wi-Fi-Smart-Home-Outdoor-Garden-Power-Stake-iOS-Android-Remote-Control/143177384799
---
### Connection
This 6-outlet outdoor garden power stake is controlled by a standard ESP-12 chip connected to a single relay, meaning that all 6 outlets are on or off simultaneously. It also has a mains switch, a manual relay trigger button, and an LED indicator.

|Programmer  | Power Stake|
|-----------:|:-----------|
|        3V3 | VCC        |
|         TX | RX         |
|         RX | TX         |
|        GND | GND        |

The button is not connected to `D0`, so you will need to shunt `D0`/`GPIO0` to GND to enable programming mode. You may need to briefly shunt RESET to GND in order to initiate connections to the device.

### Internal Device Image
![](https://raw.githubusercontent.com/untergeek/shared_images/master/devices/powerstake/powerstake_esp12s.jpg)
   
### Generic Module Config
![](https://raw.githubusercontent.com/untergeek/shared_images/blob/master/devices/powerstake/powerstake_tasmota_config.jpg)

### Additional Information

This device was found at Costco, and in fact appears to be made _for_ Costco (see image below). The regular price was $13.97 USD, but was on sale for Christmas for $9.99 USD.

![](https://raw.githubusercontent.com/untergeek/shared_images/blob/master/devices/powerstake/powerstake_front.jpg)
![](https://raw.githubusercontent.com/untergeek/shared_images/blob/master/devices/powerstake/powerstake_rear.jpg)
![](https://raw.githubusercontent.com/untergeek/shared_images/blob/master/devices/powerstake/powerstake_side1.jpg)
![](https://raw.githubusercontent.com/untergeek/shared_images/blob/master/devices/powerstake/powerstake_side2.jpg)
