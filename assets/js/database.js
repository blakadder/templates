---
---

window.database = {
  {% for page in site.templates %}
    {% if page.layout != 'templates' %}
      {% continue %}
    {% endif %}
    "{{ page.url | slugify }}": {
      "title": "{{ page.title | xml_escape }}",
      "category": "{{ page.category | xml_escape }}",
      "content": {{ page.content | strip_html | strip_newlines | jsonify }},
      "url": "{{ page.url | xml_escape }}",
      "href": "{{ site.baseurl }}{{ page.url | xml_escape }}"
    }
    {% unless forloop.last %},{% endunless %}
  {% endfor %}
};
