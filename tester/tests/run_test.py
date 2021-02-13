
import json
import requests
import logging
import subprocess
log = logging.getLogger("root")

log.addHandler(logging.StreamHandler())
log.setLevel(logging.INFO)

elasticsearch = "elasticsearch"
kibana = "kibana"
logstash = "logstash"
zookeeper = "zookeeper"

servers = [
    (elasticsearch, "http://localhost:9200", requests.get, dict, ("tagline", "You Know, for Search")),
    (kibana, "http://localhost:5601", requests.get, int, 200),
    (logstash, "http://localhost:9600", requests.get, dict, ("status", "green")),
    (zookeeper, "http://localhost:2181", subprocess.check_output, str, "imok") 
]


def error_handler(func):
    def handle(*args, **kwargs):
        try:
            return func(*args, **kwargs)
        except Exception as e:
            log.error("error testing: {}".format(e))
    return handle

@error_handler
def get_request(server, req, uri):
    if server in [elasticsearch, logstash]:
        res = req(uri)
        return json.loads(res.content)
    elif server in [kibana]:
        res = req(uri)
        return res.status_code
    elif server in [zookeeper]:
        host = uri[uri.rfind("//")+2:].split(":")
        args = "echo ruok | nc {} {}; echo".format(*host)
        res = req(args, shell=True)
        return res.strip().decode('utf-8')

def get_val(k="", v=None):
    keys = k.split(".")
    for key in keys:
        v = v.get(key)
    return v

@error_handler
def test_server(res, test_type, testing):
    if test_type is dict:
        key, value = testing
        if value == get_val(key, res):
            return True
        return False
    elif test_type in [str, int]:
        if test_type(res) == test_type(testing):
            return True
        return False

def run(servers=servers):
    for server in servers:
        name, uri, req, test_type, testing = server
        res = get_request(name, req, uri)
        if res:
            connection = test_server(res, test_type, testing)
            log.info(
                "{}: {}".format(name, "server on" if connection else "connect failed")
            )

run(servers)