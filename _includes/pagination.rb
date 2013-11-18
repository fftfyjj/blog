
  {% if paginator.total_pages > 1 %}
  <div class="row">
    <div class="col-md-8 col-sm-8 col-xs-12 col-md-offset-2 col-sm-offset-2 text-left"> 
    	<ul class="pagination">
        {% if paginator.previous_page %}
  		<li><a href="{{ paginator.previous_page_path | prepend: site.baseurl | replace: '//', '/' }}">&laquo;</a></li>
        {% else %}
        <li class="disabled"><a href="#">&laquo;</a></li>
        {% endif %}
        {% for page in (1..paginator.total_pages) %}
        {% if page == paginator.page %} 
        <li class="active"><a href="">{{ page }} <span class="sr-only">(current)</span></a></li>
        {% elsif page == 1 %}
        <li><a href="{{ '/blog/index.html' | prepend: site.baseurl | replace: '//', '/' }}">{{ page }}</a></li>
        {% else %}
        <li><a href="{{ site.paginate_path | prepend: site.baseurl | replace: '//', '/' | replace: ':num', page }}">{{ page }}</a></li>
        {% endif %}
        {% endfor %}
        {% if paginator.next_page %}
        <li><a href="{{ paginator.next_page_path | prepend: site.baseurl | replace: '//', '/' }}">&raquo;</a></li>
        {% else %}
        <li class="disabled"><a href="#">&raquo;</a></li>
        {% endif %}
    	</ul>
    </div>
  </div>
	{% endif %}

