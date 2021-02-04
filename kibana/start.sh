#/bin/bash

docker run -d\
	--name kibana \
	-v /etc/localtime:/etc/localtime:ro \
	-v /home/segu/segu_dev/docker_dev/kibana/log/:/var/log/kibana/ \
	-v /home/segu/segu_dev/docker_dev/kibana/conf/kibana.yml:/usr/share/kibana/config/kibana.yml \
	-v /home/segu/segu_dev/docker_dev/kibana/conf/logging.yml:/usr/share/kibana/config/logging.yml \
	--net=elk \
    -p 5601:5601 \
    kibana:7.8.1
