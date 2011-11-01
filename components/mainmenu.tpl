<ul id="mainmenu" class="clearfix">
  {% unless site.root_item.hidden? %}<li><a{% if site.root_item.selected? %} class="active"{% endif %} href="{{site.root_item.url}}">{{site.root_item.title}}</a></li>{% endunless %}
  {% for item in site.visible_menuitems %}
	<li{% unless item.translated? %} class="untranslated" {% endunless %}><a {% if item.selected? %} class="active" {% endif %}{% unless item.translated? %} class="fci-editor-menuadd" {% endunless %} href="{{item.url}}">{{item.title}}</a>
    {% if item.selected? %}
    {% if editmode %}
    <ul id="submenu">
      {% for level2 in item.visible_children %}
      <li{% unless level2.translated? %} class="untranslated"{% endunless %}><a {% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="fci-editor-menuadd"{% endunless %} href="{{level2.url}}">{{level2.title}}</a></li>
      {% endfor %}
        <li>{% menubtn item.hidden_children %}</li> 
        <li>{% menuadd parent="item" %}</li>
            </ul>
    {% else %}
        {% if item.children? %}
            <ul id="submenu">
      {% for level2 in item.children %}
      <li><a {% if level2.selected? %} class="active"{% endif %} href="{{level2.url}}">{{level2.title}}</a></li>
      {% endfor %}
            </ul>
        {% endif %}
    {% endif %}
    {% endif %}</li>
  {% endfor %}
        {% if editmode %}<li>{% menubtn site.hidden_menuitems %}</li>        
        <li>{% menuadd %}</li>{% endif %}
        </ul>
        {% include "MobileMenus" %}