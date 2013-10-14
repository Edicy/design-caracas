<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	{% include "SiteHeader" %}
</head>

<body>
  <div id="container">

    <div id="left_pane">
      <div id="left_pane_head">
        <div id="logo" class="clearfix">{% editable site.header %}</div>
      </div>
      
      <div id="sidebar">
        {% include "Mainmenu" %}
      </div>
    </div>

    <div id="right_pane">
      <div id="right_pane_head" class="clearfix">
        {% include "Langmenu" %}

      </div>
      <div id="body" class="clearfix">
        {% content %}

      </div>
    </div>
    <div class="clearer"></div>
    {% include "Footer" %}
    <div class="clearer"></div>
  </div>
  {% include "JS" %}
</body>
</html>