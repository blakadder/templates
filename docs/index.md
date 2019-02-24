*	[**How to use commands**](#how-to-use-commands)			
*	[**Device Control**](#control)			
*	[**Management and Configuration**](#management)			
*	[**Wi-Fi**](#Wi-Fi)			
*	[**MQTT**](#mqtt)			
*	[**Rules**](#rules)			
*	[**Timers**](#timers)			
*	[**Sensors**](#sensor)			
*	[**Power Monitoring**](#power-monitoring-specific)			
*	[**Lights (PWM and addressable RGB LED lights)**](#light)			
*	[**RF 433Mhz Bridge**](#sonoff-rf-bridge)			
*	[**IR Remote Control**](#irremote)			
*	[**SetOption List**](#setoption-overview)			
*	[**Serial Bridge**](#serial-bridge)			
*	[**MP3 Player**](#mp3-player)			
*	[**Domoticz**](#domoticz)			
*	[**KNX Protocol**](#knx)			

The Sonoff-Tasmota firmware provides three powerful man machine interfaces:<BR>**MQTT**, **web** and **serial**.

## MQTT

To send commands and view responses you'll need an [MQTT client](http://www.hivemq.com/blog/seven-best-mqtt-client-tools).

Commands over MQTT are issued by using `cmnd/%topic%/<command> <parameter>`. If there is no `<parameter>` (an empty MQTT message/payload), a query is sent for current status of the `<command>`.

See [MQTT](MQTT) wiki to find out more.

## Web 

Commands can be executed via HTTP requests, for example:

```
http://sonoff/cm?cmnd=Power%20TOGGLE
http://sonoff/cm?cmnd=Power%20On
http://sonoff/cm?cmnd=Power%20off
http://sonoff/cm?user=admin&password=joker&cmnd=Power%20Toggle
```
If you have set a password for web user interface access, this must be included (in plaintext) in the URL of the HTTP request, like so: 
```
http://sonoff/cm?&user=put_username_here&password=put_password_here&cmnd=Power%20On
```
### Console in Web UI
**Console** menu in Web UI is a convenient place to send commands and it behaves similar to a terminal connection via serial port. 

## Serial
If you flashed the device via serial method you can connect to it with a terminal application (e.g. [Termite](https://www.compuphase.com/software_termite.htm), Arduino IDE Serial Monitor) to issue commands and follow responses. This is a practical way to do a `Backlog` setup of your new device.

*The serial interface is set to 115200 bps except for Sonoff Dual and the Sonoff RF Bridge where it is set to 19200 bps.*

## Using Backlog
`Backlog` command allows executing up to 30 consecutive commands with a single command line. It is a useful feature to avoid numerous resets when setting up a new device. 


* setting up both Wi-Fi AP's
```
Backlog ssid1 myssid; password1 mypassword; ssid2 myssid2; password2 mypassword2
```
* configuring your MQTT broker, topic and activating a few options
```
Backlog mqtthost <yourhost>; mqttuser <user>; mqttpassword <password>; topic <customtopic>; setoption53 1; powerretain on
```
* specific relay control, using backlog like a script
```
Backlog status 1; power 2 on; delay 20; power 2 off; status 4
```
* using [web](#web) requests *(You have to encode "space" as '%20' and ";" as '%3B')*
```
http://sonoff/cm?user=admin&password=joker&cmnd=Backlog%20Power%20Toggle%3BPower1%20ff
```

# How to use Commands

**Commands listed are available from version 6.3.0.** Later introduced commands have their minimum version noted. If you're using an older Tasmota version some of the commands might not work.

- Every command used without a parameter (payload) returns current setting.
   * `Power` will return the status of Relay1
- Instead of `0` you can use `off` and instead of `1` you can use `on`.
   * `Power ON` turns Relay1 on
   * `Power1 1` also turns Relay1 on<BR>
- Replace `<x>` in a command with the appropriate index number. Leave it empty to use the first available.
   * `Power1` and `Power` both control Relay1<BR>
- In commands with `x..y` value parameters use a number from `x` to `y` range.
- When a command mentions resetting to *"firmware default"* it means the setting will revert to the one in the flashed binary file. If you used `user_config_override.h` at compile time it will revert to those.

**Note:** Beside results initiated by a command (synchronous) you can get asynchronous results initiated by rule trigger, telemetry event, and other changed device related values. Simply put, other messages (for example a `tele/%topic%/STATUS` message that is sent every 300 seconds by default) may precede messages published as a result of your commands. 

### Control				
				
|Command			|	Parameters
|:---			|	:---
<a id="Backlog">	</a>	Backlog	|	List of commands to be executed in sequence separated by  `;`<BR> See [Using Backlog](#using-backlog) for examples.
<a id="BlinkCount">	</a>	BlinkCount	|	Number of relay toggles ([blinks](#power)) **(does not control device LED)**<BR> `0` = blink many times before restoring power state <BR> `1..32000` = set number of blinks
<a id="BlinkTime">	</a>	BlinkTime	|	Time in 0.1 seconds to [blink](#power) (toggle Power) for a relay **(does not control device LED)**<BR> `2..3600` = set with 0.1 second increment
<a id="ButtonDebounce">	</a>	ButtonDebounce	|	User control over button debounce timing <BR>`40..1000` = set button debounce time in ms. Default is `40`
<a id="FanSpeed">	</a>	FanSpeed	|	Fan speed control *([iFan02](Sonoff-iFan02) module only)* <BR>`0` = turn fan OFF <BR> `1..3` = set fan speed <BR> `+` = increase fan speed <BR>`-` = decrease fan speed <BR>
<a id="Interlock">	</a>	Interlock	|	Relay interlock mode and group selection. Introduced in [v6.4.1.11](https://github.com/arendst/Sonoff-Tasmota/pull/5014)<BR>`0` = set self-locking mode for all relays *(default)* <BR> `1` = set interlock mode for selected relays
|			|	Add up to 8 relays in 1 to 4 interlock groups, each separated by a space. For example<BR> `1,2 3,4` = Group Relay1 and Relay2 in group 1 and Relay3 and Relay4 in group 2 (_note the space between the two group declarations_) <BR> `1,2,3` = group Relay1, Relay2 and Relay3 in a single interlock group <BR>`1 3 2,4` = Relay1 is in group 1, Relay3 in group 2, Relay2 and Relay4 in group 3
<a id="LedPower">	</a>	LedPower	|	LED power state as on or off <BR> `0` = turn LED OFF and LedState OFF <BR> `1` = turn LED ON and LedState OFF<BR>(Use `Backlog LEDPower 0; SetOption31 1` to disable LED even when Wi-Fi or MQTT is not connected)
<a id="LedState">	</a>	LedState	|	Manage LED state<BR> `0` = disable use of LED as much as possible <BR> `1` = show power state on LED (LED on when power on) *(inverted for Sonoff Touch/T1)*<BR> `2` = show MQTT subscriptions as a LED blink<BR> `3` = show power state and MQTT subscriptions as a LED blink<BR> `4` = show MQTT publications as a LED blink<BR> `5` = show power state and MQTT publications as a LED blink<BR> `6` = show all MQTT messages as a LED blink<BR> `7` = show power state and MQTT messages as a LED blink<BR>
<a id="Power">	</a>	Power\<x\>	|	Control Relay\<x\> power state and also resetting PulseTime\<x\><BR> `0` / `off` = turn OFF <BR> `1` / `on` = turn ON <BR> `2` / `toggle` = if relay is `ON` switch to `OFF` and vice versa<BR> `3` / `blink` = toggle power for [BlinkCount](#blinkcount) times each [BlinkTime](#blinktime) duration (at the end of `blink` relay power is returned to pre-blink state)<BR> `4` / `blinkoff` = stop blink sequence and return relay power to pre-blink state
<a id="PowerOnState">	</a>	PowerOnState	|	Control relay state after powering on or reboot. [More information](PowerOnState-Configuration) <BR> `0` / `off` = keep relay(s) OFF after power on <BR> `1` / `on` = turn relay(s) ON after power on <BR> `2` / `toggle` = toggle relay(s) on from last saved <BR> `3` = turn relay(s) on as last saved *(default)* <BR> `4` = turn relay(s) on and disable further relay control <BR> `5` = after a pulsetime period turn relay(s) on (acts as inverted PulseTime mode) <BR>
<a id="PulseTime">	</a>	PulseTime\<x\>	|	Set PulseTime of relay\<x\> in 0.1 seconds <BR> `0` / `off` = disable use of PulseTime for Relay\<x\> *(default)* <BR> `1..111` = set PulseTime for Relay\<x\> in 0.1 seconds increments <BR> `112..64900` = set PulseTime for Relay\<x\> with 1 seconds increment starting with 12 seconds (add 100 to desired interval in seconds, e.g. 113 = 13 seconds and 220 = 120 seconds) <BR>
<a id="SwitchDebounce">	</a>	SwitchDebounce	|	User control over switch debounce timing <BR> `40..1000` = set switch debounce time in ms. Default is `40`
<a id="SwitchMode">	</a>	SwitchMode\<x\>	|	[Switch mode](Buttons-and-Switches#switchmode) <BR> `0` = toggle *(default)* <BR> `1` = follow (0 = off, 1 = on) <BR> `2` = inverted follow (0 = on, 1 = off) <BR> `3` = pushbutton (default 1, 0 = toggle) <BR> `4` = inverted pushbutton (default 0, 1 = toggle) <BR> `5` = pushbutton with hold (default 1, 0 = toggle, Hold = hold) <BR> `6` = inverted pushbutton with hold (default 0, 1 = toggle, hold = hold) <BR> `7` = pushbutton toggle (0 = toggle, 1 = toggle)
See also			|	[`SetOption11`](#SetOption11) - Swap pushbutton single and double press functionality<BR>[`SetOption13`](#SetOption13) - Allow immediate action on single button press<BR>[`SetOption26`](#SetOption26) - Use indexes even when only one relay is present<BR>[`SetOption31`](#SetOption31) - Disable Wi-Fi LED status blinking<BR>[`SetOption32`](#SetOption32) - Set hold interval before sending hold action

### Management				
				
Command			|	Parameters
:---			|	:---
<a id="Delay">	</a>	Delay	|	`2..3600` = set delay between two backlog commands with 0.1 second increment
<a id="Emulation">	</a>	Emulation	|	`0` = disable emulation<BR>`1` = enable Belkin WeMo emulation for Alexa<BR>`2` = enable Hue Bridge emulation for Alexa
<a id="Event">	</a>	Event	|	Execute an event to trigger a rule as [documented](Rules)
<a id="FriendlyName">	</a>	FriendlyName\<x\>	|	`1` = Reset friendly name to firmware default<BR>`<value>` = set friendly name (32 char limit)
<a id="Gpios">	</a>	Gpios	|	Show list of available sensors and devices by name and index 
<a id="Gpio">	</a>	Gpio	|	Show current GPIO usage for current module
<a id="Gpio">	</a>	Gpio\<x\>	|	`<sensor>` = configure [sensor](https://github.com/arendst/Sonoff-Tasmota/blob/0658ae19599e88432bbb20348f1d49279276acd7/sonoff/sonoff_template.h#L192) to Gpio\<x\>
<a id="I2Cscan">	</a>	I2Cscan	|	Scan I2C bus and show addresses for found devices
<a id="LogHost">	</a>	LogHost	|	`1`= reset [syslog](https://www.sigmdel.ca/michel/ha/rpi/syslog_en.html) host to firmware default (`SYS_LOG_HOST`)<BR>`<value>` = set syslog host (32 chars max)
<a id="LogPort">	</a>	LogPort	|	`1`= reset [syslog](https://www.sigmdel.ca/michel/ha/rpi/syslog_en.html) port to firmware default (`SYS_LOG_PORT`)<BR>`2..32766` = set syslog port
<a id="Modules">	</a>	Modules	|	Show available modules by name and index
<a id="Module">	</a>	Module	|	Displays active module by name and index<BR>`<x>` = switch to Module\<x\> and restart
<a id="OtaUrl">	</a>	OtaUrl	|	Display current OTA URL<BR> `1` = Reset OtaUrl to firmware default<BR> `url` = set address for OTA (100 char limit)
<a id="Pwm">	</a>	Pwm	|	Display current PWM setting for enabled channels<BR>
<a id="Pwm">	</a>	Pwm\<x\>	|	`0..1023` = set PWM\<x\> channel to value
<a id="PwmFrequency">	</a>	PwmFrequency	|	`1` = reset PWM frequency to 880Hz<BR>`100..4000` = set PWM frequency (100Hz to 4kHz)
<a id="PwmRange">	</a>	PwmRange	|	`1` = reset maximum PWM range to 1023<BR>`255..1023` = set maximum PWM range
<a id="Reset">	</a>	Reset	|	`1` = reset sonoff parameters to firmware defaults and restart<BR>`2` = erase flash, reset sonoff parameters to firmware defaults and restart<BR> `3` = erase flash SDK parameters and restart<BR> `4` = reset sonoff parameters to firmware defaults but retain Wi-Fi credentials and restart<BR> `5` = erase all flash and reset parameters to firmware defaults but keep Wi-Fi settings and restart<BR>`6` = erase all flash and reset parameters to firmware defaults but keep Wi-Fi and MQTT settings and restart *(from 6.4.1.18)*<BR>*(Erase of flash can take a few seconds to complete and there is no output during the erase process on the serial or web console)*
<a id="Restart">	</a>	Restart	|	`1` = restart device<BR>`99` = force restart device without configuration save
<a id="Template">	</a>	Template	|	Show current [Template](Templates)<BR>`0` = create template from active module<BR>`1..69` = create template from a supported module<BR>`{ ... }` = create a template with a [JSON string](Templates#explanation-of-template-properties)
<a id="SaveData">	</a>	SaveData	|	`0` = save parameter changes only manually<BR>`1` = save parameter changes every second *(default)*<BR>`2..3600`= save parameter changes every x second 
<a id="SerialLog">	</a>	SerialLog	|	Disable hardware serial bridge and<BR>`0` =  disable serial logging<BR> `1` = show only error messages<BR> `2` = show error and info messages<BR>`3` = show error, info and debug messages<BR>`4` = show all messages
<a id="Sleep">	</a>	Sleep	|	`0` = turn sleep off<BR>`1..250` = set sleep duration in mSec to enable [energy saving](energy-saving) *(default = `50`)*
<a id="State">	</a>	State	|	Show current device state in `%prefix%/%topic%/RESULT` topic
<a id="Status">	</a>	Status	|	Show abbreviated [status information](JSON-Status-Responses#basic-response)<BR>`0` = show basic status information<BR>`1` = show more status information<BR>`2` = show firmware information<BR>`3` = show logging and telemetry information<BR>`4` = show memory information<BR>`5` = show network information<BR>`6` = show MQTT information<BR>`7` = show time information<BR>`8` = show connected sensor information<BR>`9` = show power thresholds *(only on modules with power monitoring)*<BR>`10` = same as `Status 8` *(kept for backwards compatibility)*<BR>`11` = show information equal to `TelePeriod` state message
<a id="SysLog">	</a>	SysLog	|	`0` = disable syslog logging<BR> `1` = show only error messages<BR> `2` = show error and info messages<BR>`3` = show error, info and debug messages<BR>`4` = show all messages
<a id="Timezone">	</a>	Timezone	|	`-13..13` = set timezone<BR>`99` = use timezone configured with `TimeDST` and `TimeSTD`
<a id="TimeDST">	</a>	TimeSTD<BR>TimeDST	|	Set standard (STD) and daylight saving (DST) timezones<BR>`0` = reset timezone parameters to firmware defaults<BR> `H` = hemisphere (`0` = northern hemisphere / `1` = southern hemisphere)<BR>`W` = week (`0` = last week of month, `1..4` = first .. fourth)<BR>`M` = month (`1..12`)<BR>`D` = day of week (`1..7` = sunday saturday saturday<BR>`h` = hour (`0..23`)<BR>`T` = timezone (`-780..780`)(offset from UTC in **MINUTES** - 780min/60min=13hrs)
<a id="Upgrade">	</a>	Upgrade	|	`1` = download firmware from `OtaUrl` and restart<BR>`<value>` = download firmware from `OtaUrl` if \<value\> is higher than device version
<a id="Upload">	</a>	Upload	|	`1` = download firmware from `OtaUrl` and restart<BR>`<value>` = download firmware from `OtaUrl` if \<value\> is higher than device version
<a id="WebLog">	</a>	WebLog	|	`0` = disable web logging<BR> `1` = show only error messages<BR> `2` = show error and info messages<BR>`3` = show error, info and debug messages<BR>`4` = show all messages
	
### Wi-Fi				
				
Command			|	Parameters
:---			|	:---
<a id="AP">	</a>	AP	|	`0` = switch to other Wi-Fi Access Point<BR>`1`= select Wi-Fi Access Point 1<BR>`2`= select Wi-Fi Access Point 2
<a id="Hostname">	</a>	Hostname	|	`1` = reset hostname to `MQTT_TOPIC-<4digits>` and restart<BR>`<value>` = set hostname (32 char limit) and restart. If hostname contains `%` it will be reset to the default instead.
<a id="IPAddress1">	</a>	IPAddress1	|	`0.0.0.0.` = use dynamic IP address (DHCP)<BR>`XXX.XXX.XXX.XXX` = set static IP address
<a id="IPAddress2">	</a>	IPAddress2	|	`XXX.XXX.XXX.XXX` = set gateway IP address
<a id="IPAddress3">	</a>	IPAddress3	|	`XXX.XXX.XXX.XXX` = set subnet mask
<a id="IPAddress4">	</a>	IPAddress4	|	`XXX.XXX.XXX.XXX` = set DNS server IP address<BR>*follow IPAddress commands with `restart 1` to apply changes*
<a id="NtpServer">	</a>	NtpServer\<x\>	|	NTP server setup (x= `1..3`)<BR>`0` = clear NtpServer\<x\> settings<BR>`1` = reset NtpServer\<x\> settings to firmware defaults<BR>`<value>` = set NtpServer\<x\> host or IP address (32 char limit)
<a id="Password">	</a>	Password	|	`1` = reset AP1 Wi-Fi password to firmware default (`STA_PASS1`) and restart<BR>`<value>`= set AP1 Wi-Fi password (64 char limit) and restart
<a id="Password">	</a>	Password\<x\>	|	`1` = reset AP\<x\> Wi-Fi password to firmware default (`STA_PASS1`) and restart<BR>`<value>`= set AP\<x\> Wi-Fi password (64 char limit) and restart
<a id="Ssid">	</a>	Ssid\<x\>	|	`1` = reset AP\<x\> Wi-Fi SSID to firmware default (`STA_SSID1` or `STA_SSID2`) and restart<BR>`<value>`= set AP\<x\> Wi-Fi SSID (32 char limit) and restart
<a id="WebPassword">	</a>	WebPassword	|	Show current web server password<BR>`0` = disable use of password for WebUI<BR>`1` = reset password to firmware default (`WEB_PASSWORD`)<BR>`<value>` = set WebUI password for user `WEB_USERNAME` (32 char limit)
<a id="WebSend">	</a>	WebSend	|	Send a command to Tasmota host. If a command starts with a `\` it will be used as a link.<BR>`[<host>:<port>,<user>:<password>] <command>`<BR>`<host>` = hostname or IP address.<BR>`<port>` = port for the device if not the default `80`<BR>`<user>` = enter username of the device you're sending the command to<BR>`<password>` = enter password of the device you're sending the command to<BR>`<command>` = command and payload<BR>*example: `[sonoff] POWER1 ON` sends `http://sonoff/cm?cmnd=POWER1 ON`*
<a id="WebServer">	</a>	WebServer	|	`0` = stop web server<BR>`1` = start web server in user mode<BR>`2` = start web server in admin mode
<a id="WifiConfig">	</a>	WifiConfig	|	`0` - disable Wi-Fi config but restart (used with alternate AP)<BR>`1` = start smart config for 1 minute and set as current config tool<BR>`2` = start Wi-Fi manager (web server at 192.168.4.1) and set as current config tool<BR>`3` = start WPS config for 1 minute and set as current config tool<BR>`4` = disable Wi-Fi config but retry other AP without restart<BR>`5` = disable Wi-Fi config but retry same AP without restart and flash writes
See also			|	[`SetOption55`](#Setoption55) - mDNS service control<BR>[`SetOption56`](#Setoption56) - Wi-Fi network scan to select strongest signal on restart<BR>[`SetOption57`](#Setoption57) - Wi-Fi network re-scan every 44 minutes with switch to +10dB stronger signal if detected

### MQTT commands				
				
Command			|	Parameters
:---			|	:---
<a id="ButtonRetain">	</a>	ButtonRetain	|	`0` = disable use of MQTT retain flag *(default)*<BR>`1` = enable MQTT retain flag on button press
<a id="ButtonTopic">	</a>	ButtonTopic	|	`0` = disable use of MQTT button topic<BR>`1` = set MQTT button topic to `<topic>`<BR>`2` = set MQTT button topic to firmware default (`MQTT_BUTTON_TOPIC`)<BR>`<value>` = set MQTT button topic (32 chars max)
<a id="FullTopic">	</a>	FullTopic	|	`1` = reset MQTT fulltopic to firmware default (`MQTT_FULLTOPIC`) and restart<BR>`<value>` = set MQTT fulltopic (100 chars max) using optional %topic% and %prefix% and restart
<a id="GroupTopic">	</a>	GroupTopic	|	`1` = reset MQTT group topic to firmware default (`MQTT_GRPTOPIC`) and restart<BR>`<value>` = set MQTT group topic (32 chars max) and restart
<a id="MqttClient">	</a>	MqttClient	|	`1` = reset MQTT client to firmware config (`MQTT_CLIENT_ID`) and restart<BR>`<value>` = set MQTT client (32 chars max) and restart.<BR>You can use wildcard `%06X` to replace with last six characters of MAC address.
<a id="MqttFingerprint">	</a>	MqttFingerprint	|	*TLS needs to be enabled in firmware for this command*<BR>`<value>` =  set current fingerprint as 20 space separated bytes (59 chars max)
<a id="MqttHost">	</a>	MqttHost	|	`0` = clear MQTT host field and allow mDNS to find MQTT host<BR>`1` = reset MQTT host to firmware default (`MQTT_HOST`) and restart<BR>`<value>` = set MQTT host (32 chars max) and restart
<a id="MqttPassword">	</a>	MqttPassword	|	`0` = clear MQTT password<BR>`1` = reset MQTT password to firmware default (`MQTT_PASS`) and restart<BR>`<value>` = set MQTT password (32 chars max) and restart
<a id="MqttPort">	</a>	MqttPort	|	Show current MQTT port
<a id="MqttPort">	</a>	MqttPort	|	`1` = reset MQTT port to firmware default (`MQTT_PORT`) and restart<BR>`<value>` = set MQTT port between 2 and 32766 and restart
<a id="MqttRetry">	</a>	MqttRetry	|	`10..32000` = set MQTT connection retry timer in seconds *(default = `10`)*
<a id="MqttUser">	</a>	MqttUser	|	`0` = clear MQTT user name<BR>`1` = reset MQTT user name to firmware default (`MQTT_USER`) and restart<BR>`<value>` = set MQTT user name (32 chars max) and restart
<a id="PowerRetain">	</a>	PowerRetain	|	MQTT [power retain state](PowerOnState-Configuration#side-effects-with-using-mqtt-messages)<BR> `0` / `off` = disable MQTT power retain on status update *(default)* <BR> `1` / `on` = enable MQTT power retain on status update <BR>
<a id="Prefix1">	</a>	Prefix1	|	`1` = reset MQTT command subscription prefix to firmware default (`SUB_PREFIX`) and restart<BR>`<value>` = set MQTT command subscription prefix (10 chars max) and restart
<a id="Prefix2">	</a>	Prefix2	|	`1` = reset MQTT status prefix to firmware default (`PUB_PREFIX`) and restart<BR>`<value>` = set MQTT status prefix (10 chars max) and restart
<a id="Prefix3">	</a>	Prefix3	|	`1` = Reset MQTT telemetry prefix to firmware default (`PUB_PREFIX2`) and restart<BR>`<value>` = set MQTT telemetry prefix (10 chars max) and restart
<a id="Publish">	</a>	Publish	|	`<topic> <payload>` = MQTT publish any topic and optional payload
<a id="Publish2">	</a>	Publish2	|	`<topic> <payload>` = MQTT publish any topic and optional payload with retain flag
<a id="SensorRetain">	</a>	SensorRetain	|	`0` = disable use of sensor MQTT retain flag *(default)*<BR>`1` = enable MQTT retain flag on message `tele/%topic%/SENSOR`
<a id="StateText1">	</a>	StateText1	|	`<value>` = set `OFF` state text (10 chars max)
<a id="StateText2">	</a>	StateText2	|	`<value>` = set `ON` state text (10 chars max)
<a id="StateText3">	</a>	StateText3	|	`<value>` = set `TOGGLE` state text (10 chars max)
<a id="StateText4">	</a>	StateText4	|	`<value>` = set `HOLD` state text (10 chars max)
<a id="SwitchRetain">	</a>	SwitchRetain	|	`0` = disable use of MQTT retain flag *(default)*<BR>`1` = enable MQTT retain flag on switch press
<a id="SwitchTopic">	</a>	SwitchTopic	|	`0` = disable use of MQTT switch topic<BR>`1` = set MQTT switch topic to `<topic>`<BR>`2` = set MQTT switch topic to firmware default `MQTT_SWITCH_TOPIC`<BR>`<value>` = set MQTT switch topic (32 chars max)
<a id="TelePeriod">	</a>	TelePeriod	|	`0` = disable telemetry messages<BR>`1` = reset telemetry period to firmware default (`TELE_PERIOD`)<BR>`10..3600` = set telemetry period in seconds *(default = `300`)*
<a id="Topic">	</a>	Topic	|	`1` = reset MQTT topic to firmware default (`MQTT_TOPIC`) and restart<BR>`<value>` = set MQTT topic (32 chars max) **and** `ButtonTopic` and restart
See also			|	[`SetOption2`](#setoption2) . Add units to status messages<BR>[`SetOption4`](#setoption4) - Return MQTT response as RESULT or %COMMAND% topic<BR>[`SetOption10`](#setoption10) - Main topic change behaviour

### Rules				
				
|Command			|	Parameters
|:---			|	:---
<a id="Rule">	</a>	Rule\<x\>	|	There are 3 separate buffers for [rule commands](Rules), each with a 511 character limit. Each of the buffers can be switched on and off individually (x = `1..3`)<BR>`0` = disable Rule\<x\><BR>`1` = enable Rule\<x\><BR>`2` = toggle Rule\<x\><BR>`4` = disable one-shot detection (perform commands as long as trigger is met)<BR>`5` = enable one-shot detection<BR>`6` = toggle one-shot detection<BR>`8` = disable stop-on-error after exception restart<BR>`9` = enable stop-on-error after exception restart<BR>`10` = toggle stop-on-error after exception restart<BR>`<value>` = define [Rule\<x\>](Rules)<BR>`+<value>` = append to [Rule\<x\>](Rules)<BR>`""` = clear Rule\<x\>
<a id="RuleTimer">	</a>	RuleTimer\<x\>	|	Up to eight timers to be used as countdown event (x = `1..8`)<BR>`0..32766` = set countdown rule timer in seconds
<a id="Mem">	</a>	Mem\<x\>	|	Manage up to 5 variables stored on flash (x = `1..5`)<BR>`<value>` = store a string value in a variable<BR>`"` = clear stored value in Mem\<x\>
<a id="Var">	</a>	Var\<x\>	|	Manage up to 5 variables stored in memory (x = `1..5`)<BR>`<string>` = store a string value in a variable<BR>`"` = clear stored value in Var\<x\>
<a id="Add">	</a>	Add\<x\>	|	`<value>` = add value to Var\<x\>
<a id="Sub">	</a>	Sub\<x\>	|	`<value>` = subtract value to Var\<x\>
<a id="Mult">	</a>	Mult\<x\>	|	`<value>` = multiply value to Var\<x\>
<a id="Scale">	</a>	Scale\<x\>	|	Scale value from a low and high limit to another low and high limits and save in Var\<x\><BR>`v` = value: the number to scale<BR>`fl` = fromLow: the lower bound of the value’s current range<BR>`fh` = fromHigh: the upper bound of the value’s current range<BR>`tl` = toLow: the lower bound of the value’s target range<BR>`th` = toHigh: the upper bound of the value’s target range
<a id="CalcRes">	</a>	CalcRes	|	`0..7` = set number of decimals to be used in `Add`, `Sub`, `Mult` and `Scale`

### Timers
To control a device locally 16 timers are programmable. They can be configured with the Timer\<x\> command following by a JSON string with optional parameters. For example:

Timer 1 will ENABLE output of POWER1 at exactly 2:23 every Tue/Wed and Sat
```
Timer1 {"Arm":1,"Time":"02:23","Window":0,"Days":"--TW--S","Repeat":1,"Output":1,"Action":1}
```

Timer 4 will TOGGLE output of POWER2 within a 30 minute window centered around 16:23 each Sunday, Monday, Thursday and Friday and will disable (disarm) after executing.
```
Timer4 {"Arm":1,"Time":"16:23","Window":15,"Days":"SM00TF0","Repeat":0,"Output":2,"Action":2}
```

When `Mode 1` or `Mode 2` is used, `Latitude` and `Longitude` become available. In that case the `Time` value is **always** used as an offset so make sure to set it to `00:00` if no offset is wanted.
```
Timer1 {"Arm":1,"Mode":2,"Time":"-2:23","Window":0,"Days":"11TW11S","Repeat":1,"Output":1,"Action":1}
```

Command			|	Parameters
:---			|	:---
<a id="Latitude">	</a>	Latitude	|	`<value>` = set latitude
<a id="Longitude">	</a>	Longitude	|	`<value>` = set longitude
<a id="Timers">	</a>	Timers	|	Timers control<BR> `0` = disable all timers<BR>`1` = enable all timers<BR>`2` = toggle all timers<BR>
<a id="Timer">	</a>	Timer\<x\>	|	Parameters for Timer\<x\> where x = `1..16`<BR>`0` = clear parameters for Timer\<x\><BR>`1..16` = copy Timer\<y\> parameters to Timer\<x\><BR>`{ "name":value ; .. }` = set all or individual parameters using JSON string with names and values from the below table of data pairs
				
JSON Name			|	JSON Value
:---			|	:---
Arm			|	`0` = disarm or disable timer<BR>`1` = arm or enable timer
Mode			|	`0` = use clock time<BR>`1` = Use local sunrise time using `Longitude`, `Latitude` and `Time` offset<BR>`2` = use local sunset time using `Longitude`, `Latitude` and `Time` offset
Time			|	`hh:mm` = set time in hours `0 .. 23` and minutes `0 .. 59`<BR>`-hh:mm` = set time in offset hours `-11 .. 12` and minutes `0 .. 59` (used with `Mode 1` and `Mode 2`)
Window			|	`0..15` = add or substract a random number of minutes to `Time`
Days			|	`SMTWTFS` = set day of weeks mask where `0` or `-` = OFF and any different character = ON
Repeat			|	`0` = allow timer only once<BR>`1` = repear timer execution
Output			|	`1..16` = select an output to be used if no rule is enabled
Action			|	`0` = turn output OFF<BR> `1` = turn output ON<BR>`2` = TOGGLE output<BR>`3` = BLINK output using [BlinkCount](#BlinkCount) parameters or execute a rule when enabled 

### Sensor				
				
Command			|	Parameters
:---			|	:---
<a id="Altitude">	</a>	Altitude	|	`-30000..30000` - altitude in meters
<a id="AmpRes">	</a>	AmpRes	|	Current sensor resolution<BR>`0..3` = maximum number of decimal points
<a id="Counter">	</a>	Counter\<x\>	|	`0` = reset Counter\<x\><BR> `1..64900` = preset Counter\<x\><BR>`-1..64900` = decrease Counter\<x\><BR>`+1..64900` = increase Counter\<x\>
<a id="CounterDebounce">	</a>	CounterDebounce	|	`0` = turn off counter debounce<BR> `1..3200` = set counter debounce time in msec
<a id="CounterType">	</a>	CounterType\<x\>	|	`0` = set Counter\<x\> as pulse Counter<BR>`1` = set Counter\<x\> as pulse Timer
<a id="EnergyRes">	</a>	EnergyRes	|	Energy sensor resolution<BR>`0..5` = maximum number of decimal points
<a id="HumRes">	</a>	HumRes	|	Humidity sensor resolution<BR>`0..3` = maximum number of decimal points
<a id="PressRes">	</a>	PressRes	|	Pressure sensor resolution<BR>`0..3` = maximum number of decimal points
<a id="Sensor13">	</a>	Sensor13	|	[INA219](https://github.com/arendst/Sonoff-Tasmota/blob/304ac6fe44c9ba9aca4478036555e9eaa442dc9b/sonoff/xsns_13_INA219.ino) calibration mode<BR>`0` = set INA219 calibration to max 32V and 2A<BR>`1` = set INA219 calibration to max 32V and 1A<BR>`2` = set INA219 calibration to max 16V and 0.4A
<a id="Sensor15">	</a>	Sensor15	|	Automatic Baseline Correction for [MH-Z19B](MH-Z19B)<BR>`0` = enabled *(default)*<BR>`1` = disabled<BR>`2` = start Zero Point Calibration
<a id="Sensor27">	</a>	Sensor27	|	[APDS-9960](APDS-9960) sensor commands<BR>`0` = enable light level and proximity sensor / disable gesture mode *(default)* <BR> `1` = enable gesture mode/ disable light level and proximity sensor<BR> `2` = enable gesture mode with half gain / disable light and proximity sensor<BR>`3..255` = Set [ATIME register](APDS-9960#known-issues) for different integration times
<a id="TempRes">	</a>	TempRes	|	Temperature sensor resolution<BR>`0..3` = maximum number of decimal points
<a id="VoltRes">	</a>	VoltRes	|	Voltage sensor resolution<BR>`0..3` = maximum number of decimal points
<a id="WattRes">	</a>	WattRes	|	Power sensor resolution<BR>`0..3` = maximum number of decimal points
See also			|	[`SetOption8`](#SetOption8)  - Show temperature in Celsius *(default)* or Fahrenheit<BR>[`SetOption18`](#SetOption18) - Set status of signal light paired with CO2 sensor

### SetOption overview				
				
Command			|	Parameters
:---:			|	:---
<a id="SetOption0">	SetOption0	</a>	|	Save power state and use after restart<BR> `0` = disable<BR> `1` = enable *(default)*
<a id="SetOption1">	SetOption1	</a>	|	Set [button multipress](Control-other-devices) mode to<BR> `0` = allow all button actions *(default)*<BR> `1` = restrict to single, double and hold actions
<a id="SetOption2">	SetOption2	</a>	|	Add units to status messages<BR>`0` = disabled *(default)*<BR> `1` = enabled
<a id="SetOption3">	SetOption3	</a>	|	[MQTT](mqtt) <BR>`0` = disable MQTT<BR> `1` = enable MQTT *(default)* 
<a id="SetOption4">	SetOption4	</a>	|	Return MQTT response as<BR> `0` = RESULT topic *(default)*<BR> `1` = %COMMAND% topic
<a id="SetOption8">	SetOption8	</a>	|	Show temperature in<BR> `0`= Celsius *(default)*<BR> `1` = Fahrenheit
<a id="SetOption10">	SetOption10	</a>	|	When the device MQTT topic changes <BR> `0` = remove retained message on old topic LWT*(default)*<BR> `1` = send "Offline" to old topic LWT
<a id="SetOption11">	SetOption11	</a>	|	Swap button single and double press [functionality](https://github.com/arendst/Sonoff-Tasmota/wiki/Control-other-devices#double-press--hold)<BR> `0` = disabled *(default)*<BR> `1` = enabled
<a id="SetOption12">	SetOption12	</a>	|	Configuration saving to flash option<BR>`0` = allow dynamic flash save slot rotation *(default)*<BR>`1` = use fixed eeprom flash slot 
<a id="SetOption13">	SetOption13	</a>	|	Allow immediate action on single button press<BR>`0` = single, multi-press and hold button actions *(default)*<BR> `1` = only single press action for immediate response. Disable by holding for 4 x key hold time (see SetOption32).
<a id="SetOption15">	SetOption15	</a>	|	Set PWM control for LED lights<BR>`0` = basic PWM control<BR>`1` = control with [`Color`](#Color) or [`Dimmer`](#Dimmer) commands
<a id="SetOption16">	SetOption16	</a>	|	Set addressable LED Clock scheme parameter<BR> `0` = clock-wise mode *(default)*<BR> `1` = counter-clock-wise mode
<a id="SetOption17">	SetOption17	</a>	|	Show [`Color`](#Color) string as<BR> `0` = hex string *(default)*<BR> `1` = comma-separated decimal string
<a id="SetOption18">	SetOption18	</a>	|	Set status of signal light paired with CO2 sensor<BR> `0` = disable light *(default)*<BR>`1` = enable light
<a id="SetOption19">	SetOption19	</a>	|	[Home Assistant](Home-Assistant) automatic discovery<BR> `0` = disabled *(default)*<BR> `1` = enabled
<a id="SetOption20">	SetOption20	</a>	|	Update of Dimmer/Color/CT without turning power on<BR>`0` = disabled *(default)*<BR>`1` = enabled
<a id="SetOption21">	SetOption21	</a>	|	Energy monitoring when power is off<BR>`0` = disabled *(default)*<BR>`1` = enabled
<a id="SetOption24">	SetOption24	</a>	|	Show pressure unit in<BR> `0` = hPa *(default)*<BR> `1` = mmHg
<a id="SetOption26">	SetOption26	</a>	|	Use indexes even when only one relay is present<BR> `0` = messages use POWER *(default)*<BR> `1` = messages use POWER1
<a id="SetOption28">	SetOption28	</a>	|	RF received data format<BR> `0` = hex *(default)*<BR> `1` = decimal 
<a id="SetOption29">	SetOption29	</a>	|	IR received data format<BR> `0` = hex *(default)*<BR> `1` = decimal 
<a id="SetOption30">	SetOption30	</a>	|	Enforce Home Assistant autodiscovery as light<BR> `0` = relays are announced as a switch and PWM as a light *(default)*<BR> `1` = both relays and PWM are announced as light
<a id="SetOption31">	SetOption31	</a>	|	Disable status LED  blinking during Wi-Fi and MQTT connection problems.[`LedPower`](#LedPower) must be set to `0` for this feature to work.<BR>`0` = LED blinking enabled *(default)*<BR> `1` = LED blinking disabled 
<a id="SetOption32">	SetOption32	</a>	|	Number of 0.1 seconds to hold button before sending `hold˙ action message. Introduced in 6.4.1.14<BR> `1..100` to set Key Hold Time from 0.1 seconds to 10 seconds *(default =`40` (4 seconds))* 
<a id="SetOption33">	SetOption33	</a>	|	Max power limit can be exceeded by number of seconds before the relay is turned off<BR> `1..250` = set number of seconds *(default = `5`)*
<a id="SetOption34">	SetOption34	</a>	|	Set [Tuya dimmer device id](https://github.com/arendst/Sonoff-Tasmota/pull/4095)<BR> `0..255' = device id
<a id="SetOption36">	SetOption36	</a>	|	Boot loop control. Introduced in 6.4.1.13<BR>`0` = disable boot loop control *(default)*<BR> `1..200` = set number of boot loops before restoring default settings
<a id="SetOption51">	SetOption51	</a>	|	View extra pins for ESP8285 in Module Config<BR>**WARNING** Do not use on ESP8266 devices!!!<BR>`0` = disable *(default)*<BR> `1` = enable
<a id="SetOption52">	SetOption52	</a>	|	Control display of optional time offset from UTC in JSON messages<BR>`0` = disable *(default)*<BR> `1` = enable
<a id="SetOption53">	SetOption53	</a>	|	Display hostname and IP address in GUI<BR>`0` = disable *(default)*<BR> `1` = enable
<a id="SetOption54">	SetOption54	</a>	|	Apply [`SetOption20`](#SetOption20) settings to commands from Tuya device<BR>`0` = disable *(default)*<BR> `1` = enable
<a id="SetOption55">	SetOption55	</a>	|	mDNS service<BR>`0` = disable *(default)* <BR> `1` = enable
<a id="SetOption56">	SetOption56	</a>	|	Wi-Fi network scan to select strongest signal on restart<BR>`0` = disable *(default)*<BR> `1` = enable
<a id="SetOption57">	SetOption57	</a>	|	Wi-Fi network re-scan every 44 minutes with switch to +10dB stronger signal if detected<BR>`0` = disable *(default)*<BR> `1` = enable
<a id="SetOption58">	SetOption58	</a>	|	[IR Raw data in JSON message](https://github.com/arendst/Sonoff-Tasmota/issues/2116#issuecomment-440716483)<BR>`0` = disable *(default)*<BR> `1` = enable
<a id="SetOption59">	SetOption59	</a>	|	Send `tele/%topic%/STATE` in addition to `stat/%topic%/RESULT` for commands: [`State`](#State), [`Power`](#Power) and any command causing a light to be turned on.<BR>`0` = disable *(default)*<BR> `1` = enable
<a id="SetOption60">	SetOption60	</a>	|	Enable normal sleep instead of [dynamic sleep](Dynamic%20Sleep)<BR> `0` = dynamic sleep *(default)*<BR> `1` = sleep
<a id="SetOption61">	SetOption61	</a>	|	Force [local operation](https://github.com/arendst/Sonoff-Tasmota/pull/4562#issuecomment-446230001) when [`ButtonTopic`](#ButtonTopic) or [`SwitchTopic`](#SwitchTopic) is set. Introduced in 6.4.1.17<BR>`0` = disable *(default)*<BR> `1` = enable

### Power monitoring specific				
				
Command			|	Parameters
:---			|	:---
<a id="AmpRes">	</a>	AmpRes	|	Current sensor resolution<BR>`0..3` = maximum number of decimal points
<a id="CurrentHigh">	</a>	CurrentHigh	|	`0` = disable current high threshold *(default)*<BR>`<value>` = set current high threshold value in miliamps
<a id="CurrentLow">	</a>	CurrentLow	|	`0` = disable current low threshold *(default)*<BR>`<value>` = set current low threshold value in miliamps
<a id="CurrentSet">	</a>	CurrentSet	|	`<value>` = auto-calibrate current to target value in mA
<a id="EnergyRes">	</a>	EnergyRes	|	Energy sensor resolution<BR>`0..5` = maximum number of decimal points
<a id="EnergyReset">	</a>	EnergyReset	|	Show Energy Total, Yesterday and Today
<a id="EnergyReset1">	</a>	EnergyReset1	|	`0..42500` = ((p)re)set Energy Today in Wh
<a id="EnergyReset2">	</a>	EnergyReset2	|	`0..42500` = ((p)re)set Energy Yesterday in Wh
<a id="EnergyReset3">	</a>	EnergyReset3	|	`0..42500000` = ((p)re)set Energy Total in Wh
<a id="FreqRes">	</a>	FreqRes	|	Frequency sensor resolution<BR>`0..3` = maximum number of decimal points
<a id="FrequencySet">	</a>	FrequencySet	|	`<value>` = auto-calibrate frequency to a target value in Hz
<a id="MaxPower">	</a>	MaxPower	|	`0` - disable use maximum power monitoring<BR>`<value>` = set maximum allowed power in W
<a id="MaxPowerHold">	</a>	MaxPowerHold	|	`1` = set default time to 10 seconds to stay over MaxPower before power off<BR>`<value>` = set time in seconds to stay over MaxPower before power off
<a id="MaxPowerWindow">	</a>	MaxPowerWindow	|	`1` = set default time to 30 seconds to stay power off before re-applying power up to 5 times<BR>`<value>` = set time in seconds to stay power off before re-applying power up to 5 times
<a id="PowerDelta">	</a>	PowerDelta	|	`0` = disable reporting on power change<BR>`1` = enable reporting on 80% power change<BR>`<value>` = set reporting on percentage power change to send an MQTT telemetry message
<a id="PowerHigh">	</a>	PowerHigh	|	`0` = disable power high threshold *(default)*<BR>`<value>` = set power high threshold value in W to send an MQTT telemetry message
<a id="PowerLow">	</a>	PowerLow	|	`0` = disable power low threshold *(default)*<BR>`<value>` = set power low threshold value in W to send an MQTT telemetry message
<a id="PowerSet">	</a>	PowerSet	|	`<value>` = auto-calibrate power to a target value in W
<a id="Status">	</a>	Status	|	`8` = show power usage<BR>`9` = show power thresholds
<a id="VoltageHigh">	</a>	VoltageHigh	|	`0` = disable voltage high threshold *(default)*<BR>`<value>` = set voltage high threshold value in V 
<a id="VoltageLow">	</a>	VoltageLow	|	`0` = disable voltage low threshold *(default)*<BR>`<value>` = set voltage low threshold value in V 
<a id="VoltageSet">	</a>	VoltageSet	|	`<value>` = auto-calibrate voltage to a target value in V
<a id="VoltRes">	</a>	VoltRes	|	Voltage sensor resolution<BR>`0..3` = maximum number of decimal points
<a id="WattRes">	</a>	WattRes	|	Power sensor resolution<BR>`0..3` = maximum number of decimal points
See Also			|	[`SetOption8`](#SetOption8) - Energy monitoring when power is off<BR>[`SetOption33`](#SetOption33) - Configure power monitoring Max_Power_Retry count number<BR>

### Light				
				
|Command			|	Parameters
|:---			|	:---
<a id="Channel>">	</a>	Channel\<x\>	|	`0..100` = set PWM channel dimmer value from 0 to 100%
<a id="Color">	</a>	Color	|	Show color setting (hex or decimal depending on [`SetOption17`](#SetOption17))<BR> `r,g,b` = set color by decimal value (`0..255`)<BR>`#CWWW` = set hex color value for CT lights <BR>`#RRGGBB` = set hex color value for RGB lights<BR>`#RRGGBBWW` = set hex color value for RGBW lights<BR>`#RRGGBBCCWW` = set hex color value for RGBCCT lights (5 PWM channels)
|			|	Set color to<BR>`1` = red<BR>`2` = green<BR>`3` = blue<BR>`4` = orange<BR>`5` = light green<BR>`6` = light blue<BR>`7` = amber<BR>`8` = cyan<BR>`9` = purple<BR>`10` = yellow<BR>`11` = pink<BR>`12` = white<BR>`+` = next color<BR>`-` = previous color
<a id="Color2">	</a>	Color2	|	Same as `Color` but adjust to current `Dimmer` value
<a id="Color3">	</a>	Color3	|	`#RRGGBB` = set seconds clock hand hex color value *(only in `Scheme 5`)*
<a id="Color4">	</a>	Color4	|	`#RRGGBB` = set minutes clock hand hex color value *(only in `Scheme 5`)*
<a id="Color5">	</a>	Color5	|	`#RRGGBB` = set hour clock hand hex color value *(only in `Scheme 5`)*
<a id="Color6">	</a>	Color6	|	`#RRGGBB` = set clock hour marker hex color value *(only in `Scheme 5`)*
<a id="CT">	</a>	CT	|	`153..500` = set color temperature from warm to cold for CT lights<BR>`+` = increase CT value by 10<BR>`-` = decrease CT value by 10
<a id="Dimmer">	</a>	Dimmer	|	`0..100` = set dimmer value from 0 to 100%<BR>`+` = increase by 10<BR>`-` = decrease by 10
<a id="Fade">	</a>	Fade	|	`0` = do not use fade *(default)* <BR>`1` = use fade
<a id="HsbColor">	</a>	HsbColor	|	`<hue>,<sat>,<bri>` = set color by hue, saturation and brightness
<a id="HsbColor1">	</a>	HsbColor1	|	`0..360` = set hue
<a id="HsbColor2">	</a>	HsbColor2	|	`0..100` = set saturation 
<a id="HsbColor3">	</a>	HsbColor3	|	`0..100` = set brightness
<a id="Led">	</a>	Led\<x\>	|	`#RRGGBB` = set Led\<x\> hex color value where `<x>` is the pixel number *(aplies only to addressable LEDs)*
<a id="LedTable">	</a>	LedTable	|	`0` = do not use [LED gamma correction](https://learn.adafruit.com/led-tricks-gamma-correction?view=all) *(default)*<BR>`1` = use gamma correction
<a id="Pixels">	</a>	Pixels	|	`1..512` = set amount of pixels in strip or ring and reset `Rotation` *(applies only to addressable LEDs)*
<a id="Rotation">	</a>	Rotation	|	`<value>` = set amount of pixels to rotate (up to `Pixels` value) *(applies only to addressable LEDs)*
<a id="Scheme">	</a>	Scheme	|	Light effects<BR>`+` = next scheme<BR>`-` = previous scheme<BR>`0` = single color for LED light *(default)*<BR>`1` = start wake up sequence (same as [`Wakeup`](#wakeup))<BR>`2` = cycle up through colors using Speed option<BR>`3` = cycle down through colors using Speed option<BR>`4` = random cycle through colors using Speed and Fade
|			|	**Following schemes are usable only with addressable LEDs, e.g. WS281X, Neopixel**<BR>`5` = clock mode ([example](https://hackaday.io/project/28194-esp-and-ws2812-based-clock))<BR>`6` = candlelight pattern<BR>`7` = RGB pattern<BR>`8` = Christmas pattern<BR>`9` = Hannukah pattern<BR>`10` = Kwanzaa pattern<BR>`11` = rainbow pattern<BR>`12` = fire pattern
<a id="Speed">	</a>	Speed	|	`1..20` = set fade speed from fast `1` to very slow `20`<BR>`+` = increase speed<BR>`+` = decrease speed
<a id="Wakeup">	</a>	Wakeup	|	Start wake up sequence from OFF to stored `Dimmer` value<BR>`0..100` = Start wake up sequence from OFF to provided `Dimmer` value
<a id="WakeupDuration">	</a>	WakeupDuration	|	`1..3600` = set wake up duration in seconds
<a id="Width1">	</a>	Width1	|	`0..4` = set LED group width *(only in `Scheme 6 - 12`)*
<a id="Width2">	</a>	Width2	|	`0..30` = set width of the seconds clock hand *(only in `Scheme 5`)*
<a id="Width3">	</a>	Width3	|	`0..30` = set width of the minutes clock hand *(only in `Scheme 5`)*
<a id="Width4">	</a>	Width4	|	`0..30` = set width of the hour clock hand *(only in `Scheme 5`)*
See also			|	[`SetOption15`](#SetOption15) - Set PWM control<BR>[`SetOption16`](#SetOption16) - Reverse Clock Scheme direction<BR>[`SetOption17`](#SetOption17) - Show [`Color`](#Color) string as hex or decimal<BR>[`SetOption20`](#SetOption20) - Update of Dimmer/Color/CT without turning power on

### Serial Bridge
Both Hardware and Software Serial Bridge are supported.
 
Hardware Serial Bridge uses GPIO1 (Tx) and GPIO3 (Rx) pins of your device.
Software Serial Bridge can use any other GPIO to be selected with command ``GPIO<x> 67``, ``GPIO<x> 68`` or in Module options by setting GPIOs to ``SerBr Tx`` and ``SerBr Rx``. Expect possible communication errors when additional sensors are configured.

|Command			|	Parameters
|:---			|	:---
<a id="Baudrate">	</a>	Baudrate	|	`1` = set hardware serial bridge to default baudrate of 115200 bps<BR>`<value>` = set baudrate
<a id="SBaudrate">	</a>	SBaudrate	|	`1` = set software serial bridge to default baudrate of 9600 bps<BR>`<value>` = set baudrate
<a id="SerialDelimiter">	</a>	SerialDelimiter	|	Show current serial delimiter
<a id="SerialDelimiter">	</a>	SerialDelimiter	|	`1..127` = set serial delimiter to [decimal ASCII](http://www.asciichart.com/)<BR>`128` = only allow ASCII characters 32 to 127 in response text<BR>`129..255` = disable serial delimiter<BR>`<value>` = set serial delimiter to [escape character code](https://en.wikipedia.org/wiki/Escape_character#ASCII_escape_character) or ASCII character
<a id="SerialDelimiter">	</a>	SerialDelimiter	|	Set serial delimiter to escape character code
<a id="SerialSend">	</a>	SerialSend	|	`<value>` = disable serial logging and send text to serial port ending with `\n`
<a id="SerialSend2">	</a>	SerialSend2	|	`<value>` = disable serial logging and send text to serial port
<a id="SerialSend3">	</a>	SerialSend3	|	`<value>` = disable serial logging, replace escape characters and send text to serial port
<a id="SerialSend4">	</a>	SerialSend4	|	`<value>` = disable serial logging and send binary data to serial port. Data in serial response messages is encoded as hex strings.
<a id="SerialSend5">	</a>	SerialSend5	|	`<value>` = disable serial logging and send hex text to serial port. Data in serial response messages is encoded as hex strings.
<a id="SSerialSend">	</a>	SSerialSend	|	`<value>` = send text to software serial port ending with `\n`
<a id="SSerialSend2">	</a>	SSerialSend2	|	`<value>` = send text to software serial port
<a id="SSerialSend3">	</a>	SSerialSend3	|	`<value>` = replace escape characters and send text to software serial port
<a id="SSerialSend4">	</a>	SSerialSend4	|	`<value>` = send binary data to software serial port. Data in serial response messages is encoded as hex strings.
<a id="SSerialSend5">	</a>	SSerialSend5	|	`<value>` = send hex text to software serial port. Data in serial response messages is encoded as hex strings.

### Sonoff RF Bridge 

|Command			|	Parameters
|:---			|	:---
<a id="RfCode">	</a>	RfCode	|	Show last sent 24-bit user code<BR>`1..8388607` = send 24-bit user code<BR>`#1..#7FFFFF` = send 24-bit hexadecimal user code using RfSync, RfLow and RfHigh timing
<a id="RfHigh">	</a>	RfHigh	|	`1` = reset high pulse time to 840 microseconds<BR>`2..32767` = set high pulse time in microseconds<BR>`#2..#7FFF` = set high pulse time in hexadecimal microseconds
<a id="RfHost">	</a>	RfHost	|	Show 16-bit host part of user code<BR>`1` = reset 16-bit host part of user code to 11802 (#2E1A)<BR>`2..32767` = set 16-bit host part of user code<BR>`#2..7FFF` = set 16-bit host part of user code in hexadecimal
<a id="RfKey">	</a>	RfKey\<x\>	|	Send learned or default RF data for RfKey\<x\> (x = `1 – 16`)<BR>`1` = send default RF data for RfKey\<x\> using RfSync, RfLow, RfHigh and RfHost parameters<BR>`2` = learn RF data for RfKey\<x\><BR>`3` = unlearn RF data for RfKey\<x\><BR>`4` = save RF data using RfSync, RfLow, RfHigh and last RfCode parameters<BR>`5` = show default or learned RF data
<a id="RfLow">	</a>	RfLow	|	`1` = reset low pulse time to 270 microseconds<BR>`2..32767` = set low pulse time in microseconds<BR>`#2..#7FFF` = set low pulse time in hexadecimal microseconds
<a id="RfRaw">	</a>	RfRaw	|	**This command only works when the firmware has been updated by the provided [Portisch firmware](https://github.com/arendst/Sonoff-Tasmota/tree/development/tools/fw_efm8bb1)**<BR>`0` = Set iTead default firmware support and messages *(default on restart)*<BR> `1` = set Portisch firmware support and messages<BR> `166` or `AAA655` = start sniffing/reading RF signals disabling iTead default RF handling<BR> `167` or `AAA755` = stop sniffing/reading RF signals enabling iTead default RF handling<BR> `168` or `AAA855` = transmiting iTead default RF protocols<BR> `169` or `AAA955` = start sniffing and learning predefined protocols<BR> `176` or `AAB055` = bucket Transmitting using command 0xB0<BR> `177` or `AAB155` = start Bucket sniffing using command 0xB1<BR> `192` or `AAC000C055` = beep (`00C0` is the length of the sound)<BR> `255` or `AAFF55` = show Rf firmware version<BR> `<value>` = hexadecimal data to be sent to RF chip
<a id="RfSync">	</a>	RfSync	|	`1` = reset start sync pulse time to 8470 microseconds<BR>`2..32767` = set start sync pulse time in microseconds<BR>`#2..#7FFF` = set start sync pulse time in hexadecimal microseconds
See also			|	[`SetOption28`](#SetOption28) - Set RF received data format

### IRremote

Using IRsend it is possible to send the same IR code in decimal, hexadecimal and RAW format:
```
IRsend {"Protocol":"NEC","Bits":32,"Data":2170978686}
IRsend {"Protocol":"NEC","Bits":32,"Data":0x8166817E}
IRsend 0,926,844,958,832,1798,868,902,848,900,870,900,852,908,918,958,794,934,874,928,1738,934,856,1764
```
See [Linux Infrared Remote Control (LIRC)](http://www.lirc.org/) for more information.

|Command			|	Parameters
|:---			|	:---
|<a id="IRsend">	</a>	IRsend	|	Send IR remote control code as JSON decimal string<BR>`{"Protocol":"<value>","Bits":<value>,"Data":<value>}`<BR>`"Protocol":"NEC"\|"SONY"\|"RC5"\|"RC6"\|"DISH"\|"JVC"\|"PANASONIC"\|"SAMSUNG"`<BR>`"Bits":1..32` = required number of data bits (for PANASONIC the address))<BR>`"Data":1..(2^32)-1` = data frame as 32 bit decimal.<BR>
|			|	Send IR remote control code as JSON hexadecimal string<BR>`{"Protocol":"<value>","Bits":<value>,"Data":<value>}`<BR>`"Protocol":"NEC"\|"SONY"\|"RC5"\|"RC6"\|"DISH"\|"JVC"\|"PANASONIC"\|"SAMSUNG"`<BR>`"Bits":1..32` = required number of data bits (for PANASONIC the address))<BR>`"Data":0x1..0xFFFFFFFF` = data frame as 32 bit hexadecimal.<BR>
|			|	Send IR remote control as RAW command<BR>`<frequency>,<rawdata1>,<rawdata\>,..` 
|<a id="IRhvac">	</a>	IRhvac	|	Send HVAC IR remote control code as JSON string<Br>`{"Vendor":"<value>","Power":<value>,"Mode":”<value>”, "FanSpeed":”<value>”,"Temp":<value>}`<BR>`"Vendor":"Toshiba"\|"Mitsubishi"\|"LG"\|"Fujitsu"`<BR>`"Power":0\|1`<BR>`"Mode":"Hot"\|"Cold"\|"Dry"\|"Auto"`<BR>`"FanSpeed":"1"\|"2"\|"3"\|"4"\|"5"\|"Auto"\|"Silence"` <BR>`"Temp":17..30`
|		See also	|	[`SetOption29`](#SetOption29)  - Set IR received data format<BR>[`SetOption58`](#SetOption58) - [IR Raw data in JSON message](https://github.com/arendst/Sonoff-Tasmota/issues/2116#issuecomment-440716483)

### MP3 Player

The MP3 Player driver is based on the one from DF Robot. They named it [DFPlayer mini](https://www.dfrobot.com/wiki/index.php/DFPlayer_Mini_SKU:DFR0299). All MP3 Players with the identical Serial Control Command structure can be used.

|Command			|	Parameters
|:---			|	:---
<a id="MP3DAC">	</a>	MP3DAC	|	`0` = DAC on *(default)*<BR>`1` = DAC off
<a id="MP3Device">	</a>	MP3Device	|	Specify playback device<BR>`1` = USB<BR>`2` = SD Card *(default (also defaults on reset or power cycle)))*
<a id="MP3EQ">	</a>	MP3EQ	|	Set equalizer mode:<BR>`0` = normal<BR>`1` = pop<BR>`2` = rock<BR>`3` = jazz<BR>`4` = classic<BR>`5` = bass)
<a id="MP3Pause">	</a>	MP3Pause	|	Pause
<a id="MP3Play">	</a>	MP3Play	|	Play, works as a normal play on a real MP3 Player, starts at first mp3 file
<a id="MP3Reset">	</a>	MP3Reset	|	Reset the mp3 player to defaults
<a id="MP3Stop">	</a>	MP3Stop	|	Stop
<a id="MP3Track">	</a>	MP3Track	|	`x` = play track \<x\>
<a id="MP3Volume">	</a>	MP3Volume	|	`0..100` = set Volume

### Domoticz

|Command			|	Parameters
|:---			|	:---
<a id="DomoticzIdx">	</a>	DomoticzIdx\<x\>	|	Show Domoticz Relay idx \<x\> (x = `1..4`)<BR>`0` = disable use of Relay idx \<x\> *(default)*<BR>`<value>` = Show Relay idx \<x\>
<a id="DomoticzKeyIdx">	</a>	DomoticzKeyIdx\<x\>	|	Show Domoticz Key idx \<x\> (x = `1..4`)<BR>`0` = disable use of Key idx \<x\> *(default)*<BR>`<value>` = Show Key idx \<x\> (to use enable [ButtonTopic](#buttontopic))
<a id="DomoticzSensorIdx">	</a>	DomoticzSensorIdx\<x\>	|	Show Domoticz Sensor idx \<x\> (x = `1..5`)<BR>`0` = disable use of Sensor idx \<x\> *(default)*<BR>`<value>` = Show Sensor idx \<x\> 
<a id="DomoticzSwitchIdx">	</a>	DomoticzSwitchIdx\<x\>	|	Show Domoticz Switch idx \<x\> (x = `1..4`)<BR>`0` = disable use of Switch idx \<x\> *(default)*<BR>`<value>` = Show Switch idx \<x\> (to use enable [SwitchTopic](#switchtopic))
<a id="DomoticzUpdateTimer">	</a>	DomoticzUpdateTimer	|	Show current update timer value in seconds<BR>`0` = disable sending interrim Domoticz status *(default)*<BR>`1..3600` = send status to Domoticz in defined intervals	
### KNX

Command			|	Parameters		
:---			|	:---		
<a id="KnxTx_Cmnd">	</a>	KnxTx_Cmnd\<x\>	|	`0` or `1` = send command using slot \<x\> set in KNX Menu at KNX_TX		
<a id="KnxTx_Val">	</a>	KnxTx_Val\<x\>	|	`<value>` = send float value using slot \<x\> set in KNX Menu at KNX_TX		
<a id="KNX_ENABLED">	</a>	KNX_ENABLED	|	Status of KNX Communications<BR>`0` = set to Disable<BR>`1` = set to Enable		
<a id="KNX_ENHANCED">	</a>	KNX_ENHANCED	|	Status of Enhanced mode for KNX Communications<BR>`0` = set to Disable<BR>`1` = set to Enable		
<a id="KNX_PA">	</a>	KNX_PA	|	KNX Physical Address<BR>`0.0.0` = address not set<BR>`x.x.x` = set the device address (example `1.1.0`)		
<a id="KNX_GA">	</a>	KNX_GA	|	Return the amount of Group Address to Send Data/Commands configured		
<a id="KNX_GA">	</a>	KNX_GA\<x\>	|	Setup Group Address to Send Data/Commands (\<x\> = KNX Group Address number)<BR>`1` = return configuration of GA\<x\><BR>`<option>, <area>, <line>, <member>` to set configuration of GA\<x\><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`<option>` = see table below for OPTION list<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`<area>, <line>, <member>` = KNX Address to Send Data/Commands<BR>		
<a id="KNX_CB">	</a>	KNX_CB	|	Return the amount of Group Address to Receive Data/Commands configured		
<a id="KNX_CB">	</a>	KNX_CB\<x\>	|	Setup Group Address to Receive Data/Commands <BR>`1` = return configuration of CB\<x\><BR>`<option>, <area>, <line>, <member>` to set configuration of CB\<x\><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`<option>` = see table below for OPTION list<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`<area>, <line>, <member>` = KNX Address to Receive Data/Commands		
						
OPTION	|	OPTION Value	|	OPTION	|	OPTION Value
:---	|	---	|	:---	|	---
1	|	Relay 1	|	17	|	TEMPERATURE
2	|	Relay 2	|	18	|	HUMIDITY
3	|	Relay 3	|	19	|	ENERGY_VOLTAGE
4	|	Relay 4	|	20	|	ENERGY_CURRENT
5	|	Relay 5	|	21	|	ENERGY_POWER
6	|	Relay 6	|	22	|	ENERGY_POWERFACTOR
7	|	Relay 7	|	23	|	ENERGY_DAILY
8	|	Relay 8	|	24	|	ENERGY_START
9	|	Button 1	|	25	|	ENERGY_TOTAL
10	|	Button 2	|	26	|	KNX_SLOT1
11	|	Button 3	|	27	|	KNX_SLOT2
12	|	Button 4	|	28	|	KNX_SLOT3
13	|	Button 5	|	29	|	KNX_SLOT4
14	|	Button 6	|	30	|	KNX_SLOT5
15	|	Button 7	|	255	|	EMPTY
16	|	Button 8	|			
