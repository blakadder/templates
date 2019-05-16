---
title: Sonoff TH10/TH16
category: relay
type: Relay
standard: global
link: https://www.itead.cc/smart-home/sonoff-th.html
image: https://user-images.githubusercontent.com/5904370/57877996-5e1d3a00-7819-11e9-9008-f183f321d45a.png
template: '{"NAME":"Sonoff TH","GPIO":[17,255,0,255,255,0,0,0,21,56,255,0,0],"FLAG":0,"BASE":4}' 
link_alt: 
---
Sonoff TH10 or TH16 / Ver 2.0 (year 2017/2018/2019) based on ESP8266.
TH10 has a relay rated to 10 amps and TH16 to 16 amps (Input voltage: 90~ 250V AC).
## Serial Flashing

![](https://smartlife.tech/blog/wp-content/uploads/2017/06/SonoffTHDiagram-1.jpg)

The 2.5mm jack socket connects to GPIO14. 

### Sonoff sensors with 2.5mm jack
Sonoff sells 3 sensors with 2.5mm jack to use with the Sonoff TH.
 1. [Sonoff TH Sensor Si7021](https://www.itead.cc/wiki/Sonoff_Sensor_Si7021)
2. [Sonoff TH Sensor AM2301](https://sonoff.itead.cc/en/products/accessories/am2301)
3. [Sonoff Temp Sensor DS18B20](https://sonoff.itead.cc/en/products/accessories/ds18b20)

Length of the wire is approximately 47cm apart from DS18b20 sensor that comes with approximately 1m long wire. Can be extended with a Sonoff 5m sensor extension cable. 

**NOTE!!!**
Normally a Si7021 sensor is an I<sup>2</sup>C device. The Sonoff labelled Si7021 sensor is BASED on an Si7021, but, to make this sensor plug'n'play on a Sonoff TH an 8-bit MCU is added on the board. This changes the I<sup>2</sup>C communication of an Si7021 sensor to one-wire communication! That is why a "Sonoff SI7021 sensor" doesn't work in combination with a I<sup>2</sup>C library. 

Tasmota supports Sonoff TH with all three Sonoff sensors. Just select module **Sonoff TH (4)** and under GPIO14 configure the sensor you have connected. 

### NOT SUPPORTED
Si7021 sensor contains an integrated resistive heating element that may be used to drive off condensation. It's recommended enabling the heater when the humidity readings are above 80%. Humidity readings above 80% become very unreliable. If the "Sonoff Si7021 sensor" is used at the dew point and condensation occurs on the sensor, the on-chip heater could be activated to dry the sensor and restore operation once the sensor is above the dew point. Turning on the heater will also reduce the tendency of the humidity sensor to accumulate an offset due to "memory" of sustained high humidity conditions. Six different power levels are available. The maximum source current of a GPIO pin on an ESP8266 is about 12mA. So the first power level of 3.09mA and second power level of 9.18mA would be theoretically usable.    

Keep that in mind if you use this "Sonoff Si7021 sensor" outdoors!  

[Si7021 Datasheet](https://www.silabs.com/documents/public/data-sheets/Si7021-A20.pdf)

## Official Sources
- [Itead Product Page](https://sonoff.itead.cc/en/products/sonoff/sonoff-th)
- [Itead Shop](https://www.itead.cc/smart-home/sonoff-th.html)
- [Itead Wiki](https://www.itead.cc/wiki/Sonoff_TH_10/16)
