Athom devices come with modified Tasmota which is not entirely compatible with regular releases. 

Before upgrading set your device to module `Generic (19)` to avoid relays clicking or constant resets after upgrade. Perform upgrade to release binaries using file upload method with tasmota.bin.gz or tasmota-lite.bin.gz. Do not use OtaUrl upgrade. Once you've upgraded apply the template!

If you try using OTA upgrade from the official server or manually upload tasmota-minimal.bin you risk soft bricking your device that can only be recovered with serial flash.

Check ***Device Information** whether it shows 2048kB for Flash Size and Program Flash Size. In that case take the