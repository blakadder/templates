This module can replace modules such as: {% for entry in site.data.modules[page.footprint] %}{{ entry.module }}{% unless forloop.last %}, {% endunless %}{% endfor %}
