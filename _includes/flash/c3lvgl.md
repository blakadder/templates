## Flashing 

Flash using [Tasmota Web Installer](https://tasmota.github.io/install/) and select Tasmota-LVGL ESP32-C3 option.

For esptool.py download f.e. [`tasmota32c3-lvgl.factory.bin`](https://github.com/tasmota/install/raw/main/firmware/unofficial/tasmota32c3-lvgl.factory.bin) and run `esptool.py write_flash 0x0 tasmota32c3-lvgl.factory.bin`