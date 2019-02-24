---
name: Panamalar NX-SM200 16A
type: plug
standard: eu
image: https://camo.githubusercontent.com/a762f613da7dae5360c72e45de6f48616fbe1f0f/68747470733a2f2f692e706f7374696d672e63632f5a4b34546b7267472f6e78736d3230302e6a7067
link: https://www.amazon.de/gp/product/B07JBRRW1M/
template: '{"NAME":"NX-SM200","GPIO":[0,255,0,255,56,134,0,0,131,17,132,21,0],"FLAG":0,"BASE":45}'
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

Works out of the box
