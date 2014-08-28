FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive

# nginx
RUN apt-get update -q
RUN apt-get install -yf build-essential python-software-properties software-properties-common
RUN add-apt-repository ppa:nginx/stable
RUN apt-get update -q
RUN apt-get -y install -y curl

# build nginx from source with http auth module enabled
RUN apt-get -y install libpcre3-dev zlib1g-dev libssl-dev
RUN curl -O http://nginx.org/download/nginx-1.6.1.tar.gz
RUN tar -xzf nginx-1.6.1.tar.gz
WORKDIR nginx-1.6.1
RUN ./configure --with-http_ssl_module --with-http_auth_request_module && make && make install

# install pystache
RUN apt-get -y install python-pip
RUN pip install pystache

# nginx configuration
ADD nginx/nginx.conf /usr/local/nginx/conf/nginx.conf
ADD nginx/nginx.default /usr/local/nginx/conf/sites-enabled/default.template
ADD start.sh /start.sh

EXPOSE 80
CMD /start.sh
