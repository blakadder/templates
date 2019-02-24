
{% for template in site.templates %}
###  [{{ template.name }} {{ template.standard | upcase }}]({{ template.url }})
  <img src="{{ template.image }}" alt="{{ template.name }}" wdith="100">
{% endfor %}
