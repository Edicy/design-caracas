<div id="footer" class="clearfix">
  {% if site.search.enabled %}<div class="search"><form action="" ><div><input type="text" id="onpage_search" /></div></form></div>{% endif %}
      <div class="footer_content">
        <div class="footer_text clearfix">{% xcontent name="footer" %}</div>
        <div id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>

      </div>
</div>