#/bin/bash
PWD=${PWD}

docker run -d \
	--name elasticsearch \
	-v /etc/localtime:/etc/localtime:ro \
	-v ${PWD}/es_data:/var/lib/elasticsearch/ \
	-v ${PWD}/log/:/var/log/elasticsearch/ \
	-v ${PWD}/conf/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
	-v ${PWD}/conf/logging.yml:/usr/share/elasticsearch/config/logging.yml \
	--net=elk \
	-p 9200:9200 \
	-p 9300:9300 \
	elasticsearch:7.8.1
