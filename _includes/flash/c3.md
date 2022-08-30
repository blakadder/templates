## Flashing 

Flash using [Tasmota Web Installer](https://tasmota.github.io/install/) and select Tasmota ESP32-C3 option.

For esptool.py download f.e. [`tasmota32c3.factory.bin`](http://ota.tasmota.com/tasmota32/release/tasmota32c3.factory.bin) and run `esptool.py write_flash 0x0 tasmota32c3.factory.bin`

To put ESP32-C3 in flash mode GPIO8 needs to be pulled high and GPIO9 pulled low. Some devices have that by default.
