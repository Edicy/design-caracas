<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">
<head>
	{% include "SiteHeader" %}
	{{blog.rss_link}}
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

      <div id="right_pane_head_small" class="clearfix">
        {% include "Langmenu" %}
      </div>

      <div id="body">
          {% if tags %}
            <div class="tagged-list-header">
                <div class="header-tag-icon"></div>
                {% if tags == empty %}
                    {{ "no_posts_tagged" | lc }}
                {% else %}
                    {{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.
                {% endif %}
            </div>
          {% endif %}
      
      {% addbutton class="add-article" %}  
        
   {% for article in articles %}
        <h2><a href="{{article.url}}">{{article.title}}</a> <span class="date">{{ article.created_at | format_date:"short" }}</span></h2>
        <div class="blog_article_attributes">{{ article.author.name }}&nbsp;&nbsp;·&nbsp;&nbsp;<strong><a href="{{article.url}}#comments">{{ "comments_for_count" |lc }}: {{ article.comments_count }}</a></strong></div>
        <p class="clearfix">
          {{ article.excerpt }} <a href="{{article.url}}">{{ "read_more" | lc }} &raquo;</a>
        </p>
   {% endfor %}
      </div>
    </div>

    <div class="clearer"></div>
    {% include "Footer" %}
    <div class="clearer"></div>
  </div>
  {% include "JS" %}
</body>
</html>
