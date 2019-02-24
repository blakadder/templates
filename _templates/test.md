---
name: RGB Smart Plug
type: plug
standard: eu
image: https://i.postimg.cc/YStMTTFq/rgbsmartplug.jpg
link: https://www.aliexpress.com/item/ET-Smart-Plug-Wifi-Socket-With-Switch-Phone-APP-Voice-Remote-Control-Monitor-Smart-Timing-Switch/32964036349.html
template: '{"NAME":"AWP07L","GPIO":[56,255,255,255,255,134,255,255,130,17,132,21,255],"FLAG":1,"BASE":18}'

---

# {{ page.name }}

#### Type: Smart {{ page.type | capitalize }}
#### Country: {{ page.standard | upcase }}

<img src="{{ page.image }}" alt="{{ page.name }}" height="200">

###  Available from:
[{{ page.link | remove_first: "https://" | remove_first: "www." | split:'/' | first | capitalize}}]({{page.link}})

### Template
{% highlight json %}
  {{ page.template }}
{% endhighlight %}

### Notes:

Power monitoring feature requires calibration.
