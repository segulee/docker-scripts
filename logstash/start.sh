#/bin/bash
PWD=${PWD}

docker run -d\
	--name logstash \
	-v /etc/localtime:/etc/localtime:ro \
	-v ${PWD}/pipeline/logstash.conf:/usr/share/logstash/pipeline/logstash.conf \
	-v ${PWD}/log/:/var/log/logstash/ \
	-v ${PWD}/conf/logstash.yml:/usr/share/logstash/config/logstash.yml \
	--net=elk \
	-p 5000:5000 \
	-p 9600:9600 \
	logstash:7.8.1