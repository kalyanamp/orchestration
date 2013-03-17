# {{ ansible_managed }}

{% if openam_java_opts %}
set CATALINA_OPTS={{ java_opts }}
{% else %}
set CATALINA_OPTS=-Xmx1024m -XX:MaxPermSize=256m
{% endif %}
