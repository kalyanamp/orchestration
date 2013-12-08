# {{ ansible_managed }}

{% if openam_java_opts is defined %}
set CATALINA_OPTS={{ openam_java_opts }}
{% else %}
set CATALINA_OPTS=-Xmx1024m -XX:MaxPermSize=256m
{% endif %}
