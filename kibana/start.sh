#/bin/bash
PWD=${PWD}

docker run -d\
	--name kibana \
	-v /etc/localtime:/etc/localtime:ro \
	-v ${PWD}/log/:/var/log/kibana/ \
	-v ${PWD}/conf/kibana.yml:/usr/share/kibana/config/kibana.yml \
	-v ${PWD}/conf/logging.yml:/usr/share/kibana/config/logging.yml \
	--net=elk \
    -p 5601:5601 \
    kibana:7.8.1
