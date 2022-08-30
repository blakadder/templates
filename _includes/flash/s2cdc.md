## Flashing 

This version uses the built in serial to USB adapter [CDC-ACM](https://docs.espressif.com/projects/esp-idf/en/v4.4/esp32s2/api-reference/peripherals/usb_device.html#usb-device-driver). 

Flash using [Tasmota Web Installer](https://tasmota.github.io/install/) and select Tasmota32-CDC ESP32-C3 option.

For esptool.py download f.e. [`tasmota32c3cdc.factory.bin`](http://ota.tasmota.com/tasmota32/release/tasmota32c3cdc.factory.bin) and run `esptool.py write_flash 0x0 tasmota32c3cdc.factory.bin`

To put ESP32-C3 in flash mode GPIO8 needs to be pulled high and GPIO9 pulled low. Some devices have that by default.
