#/bin/bash

docker run -d \
	--name elasticsearch \
	-v /etc/localtime:/etc/localtime:ro \
	-v /home/segu/segu_dev/docker_dev/elasticsearch/es_data:/var/lib/elasticsearch/ \
	-v /home/segu/segu_dev/docker_dev/elasticsearch/log/:/var/log/elasticsearch/ \
	-v /home/segu/segu_dev/docker_dev/elasticsearch/conf/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
	-v /home/segu/segu_dev/docker_dev/elasticsearch/conf/logging.yml:/usr/share/elasticsearch/config/logging.yml \
	--net=elk \
	-p 9200:9200 \
	-p 9300:9300 \
	elasticsearch:7.8.1
