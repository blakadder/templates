---
date: 2019-03-16
title: Moes 3-Way Switch
category: switch
type: Switch
standard: us
link: https://www.amazon.com/Wireless-Control-Anywhere-Compatible-Function/dp/B07KQ876W7
image: https://raw.githubusercontent.com/digiblur/Sonoff-Tasmota/development/jpgs/moes3way.JPG
template: '{"NAME":"Moes 3-Way","GPIO":[255,255,255,255,21,57,0,0,30,10,9,255,255],"FLAG":0,"BASE":18}' 
link_alt: 
---
```lua
rule1 on event#ON do power2 TOGGLE endon
rule2 on event#OFF do power2 TOGGLE endon
rule3 on power1#state=1 do backlog rule1 0; rule2 1 endon on power1#state=0 do backlog rule1 1; rule2 0 endon on switch2#state=3 do publish Moes3Way/Action Long endon
rule3 1
switchtopic 0
switchmode1 0
switchmode2 5
setoption32 7
```

To control the switch via MQTT you will need to monitor the Power1 state and send an ON/OFF as an event command.  If the light is backwards toggle the Power1 eelay once on the Tasmota GUI to follow the light correctly.  Power1 state should then follow the "light on" sensor after this.  

*Optional: A long press rule can be added to the rule3 if needed for switch2#state=3 for a long press action.*

### Sample Home Assistant Config
```yaml
- platform: mqtt
  name: "SW-HallWay"
  state_topic: "stat/SW-HallWay/POWER1"
  command_topic: "cmnd/SW-HallWay/EVENT"
  availability_topic: "tele/SW-HallWay/LWT"
  qos: 0
  payload_on: "ON"
  payload_off: "OFF"
  payload_available: "Online"
  payload_not_available: "Offline"
```






