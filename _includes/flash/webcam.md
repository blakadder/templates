## Flashing 

Flash using [Tasmota Web Installer](https://tasmota.github.io/install/) and select Tasmota32 WebCam option.

For esptool.py download f.e. [`tasmota32-webcam.factory.bin`](http://ota.tasmota.com/tasmota32/release/tasmota32-webcam.factory.bin) and run `esptool.py write_flash 0x0 tasmota32-webcam.factory.bin`

To put ESP32 in flash mode GPIO0 needs to be pulled low. 
