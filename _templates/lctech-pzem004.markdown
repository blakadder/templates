---
name: LC-Tech 1Ch and PZEM-004T
category: plug
type: DIY plug
standard: us
link: https://github.com/arendst/Sonoff-Tasmota/wiki/US-240V-Clothes-Dryer-PZEM004T-Energy-Monitor
image: https://user-images.githubusercontent.com/34340210/50610479-19fc4f00-0ea1-11e9-8238-d46a93850a32.jpg
template: '{"NAME":"HW-655 PZEM","GPIO":[0,63,0,62,0,0,0,0,0,0,0,0,0],"FLAG":0,"BASE":18}'
link_alt:
---
The PZEM-004T together with a HW-655 Relay provide a good clamp-on energy monitor for a 240V clothes dryer.

## Parts needed
* [Circuit Box](https://www.lowes.com/pd/CARLON-1-Gang-Blue-Plastic-Interior-New-Work-Standard-Switch-Outlet-Wall-Electrical-Box/3286106)
* [3-prong Dryer Electrical Cord](https://smile.amazon.com/gp/product/B002RL9JB6)
* [3-prong Dryer Receptacle](https://smile.amazon.com/gp/product/B000BQSU8C)
* [PZEM-004T](https://www.aliexpress.com/item/AC-Digital-Multifunction-Meter-Watt-Power-Volt-Amp-Current-Test-Module-PZEM-004T-For-Arduino-TTL/32840804812.html?spm=a2g0s.9042311.0.0.68b94c4drsAK0r)
* [HW-655 w/ ESP-01](https://www.aliexpress.com/item/ESP8266-5V-WiFi-relay-module-Things-smart-home-remote-control-switch-phone-APP/32771859308.html)
* [ESHION SPSD-5S AC-DC 5V Buck Converter](https://smile.amazon.com/gp/product/B01F9ZQ2YS)
* [4-pin Serial Connector](https://www.aliexpress.com/item/10Set-4Pin-JST-XH-Connectors-Plug-2-54mm-1007-26AWG-With-100mm-150mm-200mm-300mm-Length/32883270859.html?spm=a2g0s.9042311.0.0.68b94c4drsAK0r)
* DuPont Connectors & 22 AWG wire

## Preparation
Install TASMOTA ([requires 2.4.2 ESP Core or higher](https://github.com/arendst/Sonoff-Tasmota/wiki/What's-New#20181105---6303)) on the ESP-01 and confirm it is functional before connecting the PZEM-004T to its serial interface.

## Hardware connections
<img src="https://user-images.githubusercontent.com/34340210/51444410-2536e380-1cc5-11e9-8989-b181c2851863.png" height="400" /><br>

Connect the serial interface of the HW-655 with the serial interface of the PZEM-004T.

<img src="https://user-images.githubusercontent.com/34340210/50610473-1668c800-0ea1-11e9-9af6-463a04c79692.jpg" height="400" /><br>


As most parts are connected to high voltage AC it is recommended to fit the hardware in a solid enclosure.

<img src="https://user-images.githubusercontent.com/34340210/50610462-123caa80-0ea1-11e9-9c52-e9ff7722b9a8.jpg" height="400" /><br>

## Software configuration

[Module Template](Templates)<BR>
`{"NAME":"HW-655 PZEM","GPIO":[0,63,0,62,0,0,0,0,0,0,0,0,0],"FLAG":0,"BASE":18}`

Use the module template to configure the GPIO's for hardware serial connection.

**IMPORTANT: If using the connections as following, the communication works in all cores due to TASMOTA using hardware serial. If the user wants to use other GPIOs for communication, TASMOTA will emulate a serial interface using software serial. This feature does not work using core 2.3.0 due to insufficient RAM. To use the software serial feature, please compile using core 2.4.2 or greater.**

## Calibration
[Per Theo](https://github.com/arendst/Sonoff-Tasmota/issues/3208#issuecomment-405048466) - As the PZEM is a dedicated energy monitor, device calibration in TASMOTA is currently not supported.
