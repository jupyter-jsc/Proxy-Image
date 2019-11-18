#!/bin/bash
source /etc/j4j/j4j_mount/j4j_proxy/configurable-http-proxy.secret
/usr/local/bin/configurable-http-proxy \
            --ip 0.0.0.0\
            --port 8000 \
            --api-ip 0.0.0.0 \
            --api-port 8001
