<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	{% include "SiteHeader" %}
	{{blog.rss_link}}
  <title>{{article.title}} &lt; {{page.title}} | {{site.name}}</title>
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
        <h1>{% editable article.title %} <span class="date">{{ article.created_at | format_date:"short" }}</span></h1>
        <div class="blog_article_attributes">{{article.author.name}}&nbsp;&nbsp;&middot;&nbsp;&nbsp;<strong><a href="#comments">{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></a></strong></div>
        <div class="clearfix excerpt">
          {% editable article.excerpt %}
        </div>
        
        <div class="articlebody clearfix">
{% editable article.body %}
        </div>
        
        <div class="comments_area">
          <a name="comments"></a>
          <h2>{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span>
</h2>
          {% for comment in article.comments %}
          <div class="comment_area edy-site-blog-comment">
            <div class="comment_author">{{comment.author}} {% removebutton %}</div>
            <div class="comment">{{comment.body}}</div>
          </div>

          
          <div class="clearer"></div>
    {% endfor %}
          
          {% commentform %}
          {% unless comment.valid? %}<div class="comment_form_errors">
            <ul>
   {% for error in comment.errors %}
              <li>{{ error | lc }}</li>
    {% endfor %}
            </ul>
          </div> {% endunless %}
          <div class="comment_form">
            <h2>{{"add_a_comment"|lc}}</h2>
            <label for="comment_name">{{ "name" | lc }}</label>

            <input type="text" id="comment_name" name="comment[author]" value="{{comment.author}}" /><br/>
            
            <label for="comment_mail">{{ "email" | lc }}</label>
            <input type="text" id="comment_mail" name="comment[author_email]" value="{{comment.author_email}}" /><br/>
            
            <label for="comment_text">{{ "comment" | lc }}</label>
            <textarea id="comment_text" name="comment[body]" rows="10" cols="20">{{comment.body}}</textarea><br/>
            
            <input type="submit" value="{{ "submit" | lc }}" />
          </div>
    {% endcommentform %}

        </div>
        
      </div>
    </div>
    <div class="clearer"></div>
    {% include "Footer" %}
    <div class="clearer"></div>
  </div>
  {% unless editmode %}{{site.analytics}}{% endunless %}
  {% include "JS" %}
</body>
</html>
