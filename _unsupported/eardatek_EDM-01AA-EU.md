---
date_added: 2020-08-31
title: Eardatek EDM-01AA-EU
category: unsupported
type: Dimmer
image: /assets/images/Eardatek_EDM-01AA-EU.jpg
mlink: https://www.alibaba.com/product-detail/European-standard-dimmer-switch-for-LED_62308423570.html
link: https://www.aliexpress.com/item/4001093399451.html
link2: https://www.aliexpress.com/item/4001283464467.html
link3: 
flash: RTL8710BN
author: blak
---
Has an Eardatek EWN-89710BNN module based on RTL8710BN. Also sold under Zemismart and Girier brands.

![](/assets/images/Eardatek_EDM-01AA-EU_box.jpg)

The RTL module can be replaced by an ESP8266 one but there are none (afaik) that are pin compatible. Since you only need 2 GPIO's and power and the space is tight use a very small module (for example an [ESP-M3](/ESP-M3))

This is the pinout discovered with a multimeter and some trial and error for RX and TX pins.

![](/assets/images/eardatek_EDM-01AA-EU-pinout.jpg)

Once Tasmota is flashed set `Module 54`

Then issue:

```console
Backlog so97 1; TuyaMCU 21,2; DimmerRange 1,1000
```

Use dpid4 to set connected light type using `TuyaSend4`:

- `0` = led
- `1` = incandescent
- `2` = halogen 

Dpid3 sets minimum brightness threshold on a scale of 10-1000. 
