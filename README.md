Add your user templates in the appropriate section, please [resize images](https://img-resize.com/) to 150px maximum width and 100px maximum height. 

**No referral links allowed!!!**

### Plugs/sockets
|Device name|Device image|Template
|:---|:---:|:----------------------------------------------------------------------
|[AVATAR/AISIRER Smart Plug 10A](https://www.amazon.de/Avatar-Controls-Steckdosen-Energie%C3%BCberwachung-kompatibel/dp/B07D74ZGF8/)|![AVATAR Smart Plug](https://i.postimg.cc/0QWw9x6V/Bildschirmfoto-2019-02-23-um-18-38-29.png)|`{"NAME":"AWP07L","GPIO":[56,255,255,255,255,134,255,255,130,17,132,21,255],"FLAG":1,"BASE":18}`|
|[RGB Smart Plug 16A](https://www.aliexpress.com/item/ET-Smart-Plug-Wifi-Socket-With-Switch-Phone-APP-Voice-Remote-Control-Monitor-Smart-Timing-Switch/32964036349.html?spm=a2g0s.9042311.0.0.6ce44c4da0LQpv)|![RGB Smart Plug](https://i.postimg.cc/YStMTTFq/rgbsmartplug.jpg)|`{"NAME":"RGB Smart Plug","GPIO":[37,0,39,0,38,134,0,0,131,17,132,21,0],"FLAG":0,"BASE":45}`|
|[Panamalar NX-SM200 16A Plug](https://www.amazon.de/gp/product/B07JBRRW1M/)|![Panamalar NX-SM200](https://i.postimg.cc/ZK4TkrgG/nxsm200.jpg)|`{"NAME":"NX-SM200","GPIO":[0,255,0,255,56,134,0,0,131,17,132,21,0],"FLAG":0,"BASE":45}`|
|[SP201 Based Dual Plugs](https://www.amazon.com/gp/product/B07L63S731)|![SP-201 Based Dual Plugs](https://i.postimg.cc/fLQgjcVT/61-B2-O12-LOOL-SL1500.jpg)|`{"NAME":"SP-201","GPIO":[31,0,0,131,17,134,0,0,21,18,132,22,0],"FLAG":0,"BASE":45}`|
|[UK Power monitoring plug](https://www.amazon.co.uk/TECKIN-Outlet-Wireless-Control-Required/dp/B07D7C74RQ/)|![TECKIN UK Plug](https://i.postimg.cc/02xRdWH3/TECKIN-419c-Rq0-U6x-L-SL1001.jpg)|`{"NAME":"SM-110","GPIO":[57,255,56,255,0,134,0,0,131,17,132,21,0],"FLAG":0,"BASE":45}`|
|[WAZA Smart Plug 10A](https://www.amazon.it/gp/product/B07BXTYVJ9/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1)|![WAZA Smart Plug](https://images-na.ssl-images-amazon.com/images/I/31g4uLv1pTL._SS40_.jpg)|`{"NAME":"WAZA","GPIO":[0,0,0,0,21,17,0,0,56,0,0,0,0],"FLAG":1,"BASE":18}`|

### Power Strips
|Device name|Device image|Template|
|:---|:---:|:----------------------------------------------------------------------
|    |     |         
[Viflykoo 3 socket + USB Wifi power strip (Nocovy0428wifide3)](https://www.amazon.de/gp/product/B0779RF8NY)|![](https://images-na.ssl-images-amazon.com/images/I/61cW9rz82dL._SL1000_.jpg)|`{"NAME":"Viflykoo 3xStr","GPIO":[0,0,53,0,0,23,0,0,21,56,17,24,22],"FLAG":1,"BASE":18}`<BR><BR>Button controls single relay only. To switch other relays. <br>`rule on button1#state do backlog POWER1 toggle; POWER2 toggle; POWER3 toggle; POWER4 toggle endon`|
[Geekbes 4 socket + USB Wifi power strip (B078W23BW9)](https://www.amazon.de/gp/product/B078W23BW9)|![](https://images-na.ssl-images-amazon.com/images/I/516dkAyhUCL._SL1000_.jpg)|`{"NAME":"Geekbes 4xStri","GPIO":[0,56,0,17,22,21,0,0,23,24,25,0,0],"FLAG":1,"BASE":18}`<BR><BR>Button controls single relay only. To switch other relays: <br>`rule on button1#state do backlog POWER1 toggle; POWER2 toggle; POWER3 toggle; POWER4 toggle; POWER5 toggle endon`|

### Lights/LED controllers
|Device name|Device image|Template
|:---|:---:|:----------------------------------------------------------------------
|[Merkury A19 60W Dimmable White Bulb](https://www.walmart.com/ip/Merkury-Innovations-A19-Smart-Light-Bulb-60W-Dimmable-White-LED-1-Pack/512088827)|![MI-BW902-999W](https://i.postimg.cc/gkJfzyqw/MI-BW922-999-W.jpg)|`{"NAME":"MI-BW902-999W","GPIO":[0,0,0,0,0,37,0,0,0,0,0,0,0],"FLAG":0,"BASE":18}`
|[Merkury A21 75W RGBW Bulb](https://www.walmart.com/ip/Merkury-Innovations-A21-Smart-Light-Bulb-75W-Color-LED-1-Pack/254063201)|![MI-BW904-999W](https://i.postimg.cc/hjh3QNMz/MI-BW904-999-W.jpg)|`{"NAME":"MI-BW904-999W","GPIO":[0,0,0,0,140,37,0,0,0,142,141,0,0],"FLAG":1,"BASE":69}`
|[Merkury BR30 65W Tunable White Bulb](https://www.walmart.com/ip/Merkury-Innovations-BR30-Smart-Light-Bulb-65W-Tunable-White-LED-1-Pack/404320234)|![MI-BW905-999W](https://i.postimg.cc/yNkmWdpy/MI-BW905-999-W.jpg)|`{"NAME":"MI-BW905-999W","GPIO":[0,0,0,0,37,37,0,0,38,0,0,0,0],"FLAG":0,"BASE":18}`
|[Electrodragon ESP LED Strip Board](https://www.electrodragon.com/product/esp-led-strip-board/)|![ESP LED Strip](https://1436477554.rsc.cdn77.org/wp-content/uploads/2017/06/ESP-LED-Strip-Board-04.jpg)|`{"NAME":"ED LedStrip","GPIO":[0,0,0,0,0,0,0,0,39,38,0,37,0],"FLAG":1,"BASE":18}`
|[Feit Electric RGBW Bulb (note BGR color order)](https://www.amazon.com/FEIT-OM60-RGBW-CA-AG/dp/B07GG98VV2/)|![OM60/RGBW/CA/AG](https://i.postimg.cc/Lsy8yhhV/9069d0d126e191d54784a2cd6602bc26.jpg)|`{"NAME":"OM60/RGBW","GPIO":[255,255,255,255,140,37,0,0,38,142,141,255,255],"FLAG":0,"BASE":18}`
|[Feit Electric WiFi LED Dimmable 65W Equivalent Soft White (2700K) Light](https://www.amazon.com/Feit-Electric-Equivalent-BR30-927CA/dp/B07GG5ZV5Y)|![BR30/927CA/AG](https://i.postimg.cc/CLHysLxR/31-Xm-TZm-Jjx-L.jpg)|`{"NAME":"Feit BR30 WW","GPIO":[0,0,0,0,0,37,0,0,0,0,0,0,0],"FLAG":0,"BASE":18}`
|[Feit Electric WiFi LED Dimmable 65W Equivalent Daylight (10K) Light](https://www.amazon.com/Feit-Electric-BR30-950CA-AG/dp/B07GFYYTDP)|![BR30/950CA/AG](https://i.postimg.cc/WpmjX79p/asdfasdfasf.png)|`{"NAME":"Feit BR30 CW","GPIO":[0,0,0,0,0,37,0,0,0,0,0,0,0],"FLAG":0,"BASE":18}`

### Switches/Dimmers
|Device name|Device image|Template|
|:---|:---:|:----------------------------------------------------------------------
|    |     |         

### Miscellaneous
|Device name|Device image|Template
|:---|:---:|:----------------------------------------------------------------------
|[WL-SW01_10](WL-SW01_10-WiFi-Smart-Switch)|![](https://i.postimg.cc/Fz1YDhyW/sw10.jpg)|`{"NAME":"WL-SW01_10","GPIO":[17,149,0,148,0,0,0,0,21,56,0,0,0],"FLAG":0,"BASE":1}`
