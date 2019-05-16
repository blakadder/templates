---
title: Sonoff RF Bridge 433
category: misc
type: RF Bridge
standard: global
link: https://www.itead.cc/sonoff-rf-bridge-433.html
image: https://user-images.githubusercontent.com/5904370/57891774-eeb94180-783c-11e9-9031-676fae24ce1c.png
template: '{"NAME":"Sonoff Bridge","GPIO":[17,148,255,149,255,255,0,0,255,56,255,0,0],"FLAG":0,"BASE":25}' 
link_alt: 
---
## Overview

In addition to the ESP8266, the bridge has an *RF chip* (433MHz) for which there is a custom firmware commonly referred to as 'Portisch'. The original Sonoff RF firmware is limited. By updating the firmware of the RF chip (EFM8BB1 MCU), new features and types of devices become usable. Tasmota supports the Original Sonoff RF firmware and [Portisch firmware](https://github.com/Portisch/RF-Bridge-EFM8BB1).

The RF upgrade requires wiring the bridge and then flashing the firmware via Sonoff-Tasmota Web UI.

## Serial Connection

Please see the [Hardware Preparation](https://github.com/arendst/Sonoff-Tasmota/wiki/Hardware-Preparation) page for general instructions.

As always, you need to access the serial interface. The **four serial pins** (3V3, RX, TX, GND) connected to the ESP8285 are available on the 5-pin header just next to the switch as can be seen in the image.

![](https://github.com/arendst/arendst.github.io/blob/master/media/sonoff_bridge_2.jpg?raw=true)

Move the switch towards the 5-pin header, keep the button on the edge pressed and connect the serial-to-USB adapter.

After programming make sure to move the switch away from the 5-pin header to restore connection to the RF microcontroller. Select device Sonoff Bridge in configuration page!!!

### Video tutorial by alsolh
[![](http://img.youtube.com/vi/XixXbg2T4Ns/0.jpg)](http://www.youtube.com/watch?v=XixXbg2T4Ns "")

## Operation
During normal operation the serial interface is used at 19200 baud to communicate with the RF microcontroller. It is therefore wise to disable serial logging ([`SerialLog 0`](https://github.com/arendst/Sonoff-Tasmota/wiki/Commands#seriallog)).

The bridge is able to learn up to 16 different remote control commands of fixed code at 433 MHz frequency as provided by PT2260, PT2262, PT2264 and EV1527 transmitters. It was not able to recognize the latest Klik Aan Klik Uit (KaKu) remote control signals but some people managed to use the fixed code KaKu devices like PAR-1000 receiver and PAT-103 transmitter.

Tasmota provides default remote control commands to all 16 keys so you can start using the bridge with a Sonoff 4CH Pro or Sonoff RF device without having the bridge have to learn remote control commands.

See [RF Commands](https://github.com/arendst/Sonoff-Tasmota/wiki/Commands#sonoff-rf-bridge) for Sonoff RF Bridge 433 specific commands.

**IMPORTANT:** In the Module configuration GPIO4 and GPIO5 must be left as **`00 None`**

## RF Firmware Upgrade
**Attention ⚠️️⚠️️⚠️️ There are 2 versions of the `Sonoff RF Bridge 433`: the `R1` and the `R2 V1.0`. Wiring for `R2 V1.0` RF firmware flashing shown on the right.

<img src="https://github.com/arendst/arendst.github.io/raw/master/media/sonoff_bridge_rffw_upgrade.png" width="300" align="right">

1. This first step will be different depending on your version of the `Sonoff RF Bridge 433`. You will have to connect two wires:
   1. For `R1`: Connect `GPIO4 to C2Ck` and `GPIO5 to C2D`. This wiring will look DIFFERENT than the picture to the right.
   2. For `R2`: Connect `GPIO4 to C2D` and `GPIO5 to C2Ck`. This wiring will look IDENTICAL to the picture on the right.
2. Switch the ON/OFF switch on the board to 'OFF' to switch off the RF.
3. Power up the bridge via the 3.3V & GND pins. (See below if you need the USB power)
4. Go to the Web UI **Firmware Upgrade** > **Upgrade by File Upload**
    * Available since Tasmota v6.0.0a
    * Make sure you have set module to "Sonoff Bridge" otherwise you may get `error "Magic byte is not 0xE9"`
5. Select the .hex firmware file of your choosing.
    1. In Sonoff-Tasmota package under [tools/fw_efm8bb1](https://github.com/arendst/Sonoff-Tasmota/tree/master/tools/fw_efm8bb1) folder.
        * These are also Portisch firmware but may not be the latest.
    2. Latest [Portisch firmware](https://github.com/Portisch/RF-Bridge-EFM8BB1)
6. Hit **Start Upgrade**. The flashing should complete within 60 seconds. Device will restart after upgrade completes.
7. Disconnect wiring and put the ON/OFF switch on the board back to 'ON' to enable the RF again.

### Hardware Preparation - _R2 Board only_

_This section applies only to the R2 revision of the Sonoff RF Bridge_

<img src="https://user-images.githubusercontent.com/34340210/53682776-39f49700-3cc7-11e9-9184-4cecf2a3a4c3.png" width="250" align="right" />

Apply this modification if you intend to use USB for powering the device during flash process or if you want to use GPIO4 or GPIO5 for other purposes with the RF Bridge.

The R2 revision boards connect the GPIO4 and GPIO5 pins to the USB data lines of the power connector. Compliant USB chargers/power supplies are expected to short the two pins together, which is no good. These lines are not used by the original firmware, nor by Tasmota. The traces toward the USB power connector need to be cut to avoid interference by the USB wiring. Removing these connections does not interfere with the normal Bridge functionality.

## Portisch Firmware Specific Usage
These sections only apply to the custom Portisch firmware.

### Learning Commands with Portisch Firmware
In order to learn Buttons from your remote, go to the Console of your RF Bridge.
There, enter `rfraw 177` and push the buttons on your remote. Repeat each button 2-3 times, as the signal may be different for each try.
This will give you a so called B1 code of your button, which needs to be converted to a B0 code (see below).

### Sending Commands with Portisch Firmware
The commands learned with Portisch Firmware **cannot** be stored in device memory. 
Instead, they must be sent as a command.

Example using MQTT:
```
cmnd/sonoffRFBridge/Backlog RfRaw AAB0210314016703F924180101011001100110010101100110011001010110010101100255; RfRaw 0]
```
Refer to [issue #3973](https://github.com/arendst/Sonoff-Tasmota/issues/3973) for further information.


### Interactive B1 to B0 tool
An [interactive tool](https://github.com/henfri/bitbuckedconverter/blob/master/BitBucketConverter) was developed to learn Commands/Codes.  
Process:  
1. Run `rfraw 177` in your SonOff console 
2. Push all your remote (each Button 2-3 times)  
3. Save everything from the console that happened after `rfraw 177` to a file, e.g. console.txt  
4. Run bitbuckedconverter.py -f console.txt
   - Each line of console.txt will be converted into a B0 string and displayed
5. Run bitbuckedconverter.py -f console.txt -e
   - Each line of console.txt will be converted into a B0 string and sent to the Bridge

Then:  
* If the device reacted as expected, you can enter a name of the button (e.g., "light")  
* Else enter nothing to try the next  
* Repeat this until all lines have been tried  
* The tool will create a list of buttons and their B0 codes that have worked (i.e. for which you have specified a name)  
* In the end you can test all of these codes  

### B1 to B0 helping tool
_(if you prefer the non interactive version)_

After learning how bitbucket works from [here](https://github.com/Portisch/RF-Bridge-EFM8BB1/issues/23), this is a python script to help calculate the right 'B0' message to send using ['RfRaw'](Commands#rfraw) command in Tasmota from the received 'B1' sniffing message (rename file from 'BitBucketConverter.txt' to 'BitBucketConverter.py'.

[Python Script](https://github.com/Portisch/RF-Bridge-EFM8BB1/files/2374903/BitBucketConverter.txt)

In the command line give the 'B1' message string and the retries value (in decimal):
e.g., `BitBucketConverter.py "AA B1 04 07EB 0157 00FD 3EBC 010101010101101001010101101010100103 55" 20`

Command Line : `"AA B1 04 07EB 0157 00FD 3EBC 010101010101101001010101101010100103 55" 20`
Result: `RfRaw AAB01C041407EB015700FD3EBC01010101010110100101010110101010010355`

### 'Raw sniffing' procedure.
As suggested by the Portisch firmware, perform the following:

In the Tasmota console, send
`RfRaw AAB155`

This will result in two consecutive messages:
1. The first one tells you that you are using one of the new firmware commands
   `22:58:44 MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":"ON"}`

2. The second one tells that the EFM8BB1 RF chip new firmware accepts the command and enters raw sniffing mode ('A0' means 'ACK')
   `22:58:44 MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AAA055"}}`

After that keep pushing one of the buttons on the remote.
```
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AAA055"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 04 07F0 0128 00F2 3822 010101010101101001010101101010100103 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F9 0124 37DC 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F9 0124 37DC 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F4 0126 37D2 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F5 0127 37D2 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F7 0125 37DC 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F9 0125 37D2 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F4 0123 37C8 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F9 0124 37D2 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07FC 011E 37D2 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F8 0125 37D2 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F8 0124 37D2 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F9 0125 37D2 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F8 0122 37C8 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F1 012D 37D2 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F4 0123 37C8 010101010101101001010101101010100102 55"}}`
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F8 0128 37C8 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F9 0124 37D2 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F4 0124 37C8 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F9 0124 37C8 010101010101101001010101101010100102 55"}}
MQT: tele/sonoffRFbridge/RESULT = {"RfRaw":{"Data":"AA B1 03 07F4 0123 37D2 010101010101101001010101101010100102 55"}}
```

Notice that this sequence of messages all start with 'AA' then 'B1' and the last byte '55'

The reason for pushing the remote button for several seconds is to get enough 'AA B1 ...... 55' sequences to select the best one to be transmitted back.

Then discard the sequences with 'data values' not equal.

In the example 'data values' are the **`010101010101101001010101101010100102`** string.

Notice that before that 'data values' string there are several 2 byte values (they are called 'buckets'); they are time values in microseconds. The number of 'buckets' is indicated in a previous byte (in the example a 3 or a 4).

In the example, discard the first message (it contains 4 buckets, whereas the rest have only 3 buckets).
Examine the values on the buckets in order to choose the message where more buckets are 'similar'.

For example messages with '_**37D2**_' in the third bucket are good candidates. Messages with '_**0124**_' in the second bucket are also good candidates. First bucket values are very similar; '_**07F8**_' can be a good one.

## Official Sources
* [Itead Product Page](http://sonoff.itead.cc/en/products/appliances/sonoff-rf-bridge-433)
* [Itead Shop](https://www.itead.cc/sonoff-rf-bridge-433.html)
* [Itead Wiki](https://www.itead.cc/wiki/Sonoff_RF_Bridge_433)
* [How to Flash the RF Bridge](https://github.com/arendst/Sonoff-Tasmota/wiki/How-to-Flash-the-RF-Bridge)   
* [RF Bridge 433 R2 Information](https://github.com/arendst/Sonoff-Tasmota/issues/1916)