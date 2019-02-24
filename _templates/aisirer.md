---
name: Aisirer 10A
type: plug
standard: eu
image: https://camo.githubusercontent.com/2aebd8684b584fa7cbbb1197ef2dde845f82082b/68747470733a2f2f692e706f7374696d672e63632f30515777397836562f42696c6473636869726d666f746f2d323031392d30322d32332d756d2d31382d33382d32392e706e67
link: https://www.amazon.de/Avatar-Controls-Steckdosen-Energie%C3%BCberwachung-kompatibel/dp/B07D74ZGF8/
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

Can be found under name AISIRER
