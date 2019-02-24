|Name|Image|Type
|---|---|---|{% for template in site.templates %}
|**[{{ template.name }}]({{ template.url }})** |<img src="{{ template.image }}" alt="{{ template.name }}" width="60" align="center"> | Smart {{ template.type | capitalize }} {{ template.standard | upcase }} |{% endfor %}
