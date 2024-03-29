---
date_added: 2020-01-31
title: LoraTap WH100W-EU 20A
category: unsupported
type: Switch
image: https://user-images.githubusercontent.com/5904370/72208571-47aca880-34a4-11ea-98ce-1358de700def.png
link: https://www.aliexpress.com/item/33032606776.html
link2:
mlink: https://www.loratap.com/eu-wifi-boiler-water-heater-switch-4400w-tuya-smart-life-app-remote-control-on-off-timer-voice-control-google-home-alexa-echo-p0053.html
chip: WR3E
---
There's a listing for a US model [WH100W-US](/loratap_WH100W-US.html) which was successfully Tuya Converted in December 2019 but there is a high possibility it will also have the new chip.

Update: LoraTap representative informed me that their devices are using various wi-fi chipsets across their product lines.

This review sample was provided by LoraTap free of charge!

## Packaging

The switch arrived extremely well packed with screws, some wire and one WAGO 3 wire connector which was a very nice touch.

![Packaging](https://user-images.githubusercontent.com/5904370/72208475-4333c000-34a3-11ea-961f-5032cbc8f145.png)
![Goodies](https://user-images.githubusercontent.com/5904370/72208468-3020f000-34a3-11ea-8328-02517470e555.png)

After the main wires were connected the switch was easily added to the Tuya app. It supports power on/off and timers from the app.

![Connected](https://user-images.githubusercontent.com/5904370/72208605-c86ba480-34a4-11ea-8246-f4bab150742c.png)

Tuya-Convert, on the other hand, **failed**. After trying the newest development version and the still unmerged PR fixes there was still no success which was puzzling since the US version template submission claimed Tuya-Convert works.

It was time to bring out the screwdrivers and soldering iron. The touch button PCB has the wi-fi module on the underside but it is soldered together with the relay board suing 2.0mm long pin headers. Unsoldering those were proving to be a pain so i simply clipped them hoping to solder in new pin headers.

![Front touch pane](https://user-images.githubusercontent.com/5904370/72208540-0d430b80-34a4-11ea-958f-8ecf8ec5d3ee.png)

After detaching the touch PCB and removing the sticker placed on the wi-fi module to prevent shorts when touching the relay PCB I realised why Tuya-Convert was failing. The module is WR3E which has a Realtek chip inside. *Cue sad music*

![WR3E](https://user-images.githubusercontent.com/5904370/72208608-e9cc9080-34a4-11ea-9e03-1d1b5297d8c9.png)
PCB markings: WH100W-EU-KEY 20190916

Unless you can replace the chip with a pin compatible ESP12 or macgyver something with a different board, look elsewhere for a 20A smart switch.

The good new is that the relay board has a 20A 22V relay as claimed, therefore there is a project to use the relay board with some ESP826 module or a D1 mini in the future.

![Relay PCB](https://user-images.githubusercontent.com/5904370/72208629-4b8cfa80-34a5-11ea-9a53-e6d64c3c13f5.png)

