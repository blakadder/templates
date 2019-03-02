---
title: Powrui AW-39
category: plug
type: Power Strip
standard: us
template: '{"NAME":"Porui AW-39","GPIO":[56,0,0,0,21,255,0,0,23,24,22,0,9],"FLAG":0,"BASE":18}'
link: https://www.amazon.com/gp/product/B07KK62GB7/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1
image: https://user-images.githubusercontent.com/5904370/53308200-82fbb400-389f-11e9-80a8-6686b28539d4.png
---
This allows you to turn on and off all the relays
`SwitchTopic1 0`
`SwitchMode1 5`
`SetOption32 20`
`Rule1 on switch1#state=3 do power1 2 endon on switch1#state=2 do delay endon on switch1#state=3 do power2 2 endon on switch1#state=2 do delay endon on switch1#state=3 do power3 2 endon on switch1#state=2 do delay endon on switch1#state=3 do power4 2 endon on switch1#state=2 do delay endon`
