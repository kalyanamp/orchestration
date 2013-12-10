# {{ ansible_managed }}

java -jar logstash.jar agent --config {{ logstash_dir }}/conf/logstash.conf
