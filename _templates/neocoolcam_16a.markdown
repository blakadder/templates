---
date: 2019-10-27
title: NEO Coolcam 16A
category: plug
type: Plug
standard: eu
link: https://www.aliexpress.com/item/NEO-Coolcam-Smart-Plug-WiFi-Socket-3680W-16A-Power-Energy-Monitoring-Timer-Switch-EU-Outlet-Voice/32966183521.html
image: https://ae01.alicdn.com/kf/HTB1CiBnasvrK1Rjy0Feq6ATmVXaL/NEO-Coolcam-Smart-Plug-WiFi-Socket-3680W-16A-Power-Energy-Monitoring-Timer-Switch-EU-Outlet-Voice.jpg
template: '{"NAME":"Neo Coolcam 16","GPIO":[17,0,0,0,133,132,0,0,131,56,21,0,0],"FLAG":0,"BASE":49}' 
link_alt: https://www.szneo.com/en/products/show.php?id=215
---

The first template is intended for legacy devices that use a HLW8012 circuit for power monitoring. Newer devices (Q2/2019) include a Belling BL0937 chip and therefore, GPIO04 has to be changed to 134:
```
{"NAME":"Neo Coolcam 16","GPIO":[17,0,0,0,134,132,0,0,131,56,21,0,0],"FLAG":0,"BASE":49}
```
If used with the wrong setting, i.e. 133 instead of 134, the voltage readout will show values like 780V instead of 230V.

All revisions of this plug can be flashed using tuya-convert.
