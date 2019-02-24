---
name: RGB Smart Plug
type: plug
standard: eu
image: https://i.postimg.cc/YStMTTFq/rgbsmartplug.jpg
link: https://www.aliexpress.com/item/ET-Smart-Plug-Wifi-Socket-With-Switch-Phone-APP-Voice-Remote-Control-Monitor-Smart-Timing-Switch/32964036349.html
template: '{"NAME":"AWP07L","GPIO":[56,255,255,255,255,134,255,255,130,17,132,21,255],"FLAG":1,"BASE":18}'
note: Power monitoring requires some calibration
---
{% for template in site.templates %}

# {{ template.name }}

#### Type: Smart {{ template.type | capitalize }}
#### Country: {{ template.standard | upcase }}

<img src="{{ template.image }}" alt="{{ template.name }}" height="200">

###  [Available from]({{ template.link }})
{{ template.link | remove_first: "https://" | split:'/' | first }}

### Template
{% highlight json %}
  {{ template.template }}
{% endhighlight %}

### Notes:

{{ template.note }}

{% endfor %}
