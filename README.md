Nginx authentication proxy
==========================

Simple proxy used to send the request using the proxy_pass directive to an authentication backend specified using the AUTH_BACKEND environment variable. Traffic that passes the authentication backend will then be sent to the backend specified using the BACKEND environment variable.

Running the docker container:
```
ubuntu@trusty-64:/nginx-auth# docker build -t nginx-auth
ubuntu@trusty-64:/nginx-auth# docker run -e AUTH_BACKEND=https://someauthapi -e BACKEND=http://youprivateregistry -p 0.0.0.0:8080:80 nginx-auth
```
