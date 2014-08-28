#!/bin/bash

NGINX=/usr/local/nginx

pystache "`cat ${NGINX}/conf/sites-enabled/default.template`" "{\"auth_backend\":\"${AUTH_BACKEND}\", \"backend\":\"${BACKEND}\"}" > ${NGINX}/conf/sites-enabled/default

${NGINX}/sbin/nginx
