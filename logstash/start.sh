#/bin/bash

docker run -d\
	--name logstash \
	-v /etc/localtime:/etc/localtime:ro \
	-v /home/segu/segu_dev/docker_dev/logstash/pipeline/logstash.conf:/usr/share/logstash/pipeline/logstash.conf \
	-v /home/segu/segu_dev/docker_dev/logstash/log/:/var/log/logstash/ \
	-v /home/segu/segu_dev/docker_dev/logstash/conf/logstash.yml:/usr/share/logstash/config/logstash.yml \
	--net=elk \
	-p 5000:5000 \
	-p 9600:9600 \
	logstash:7.8.1