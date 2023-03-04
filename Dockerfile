FROM debian:9-slim

#RUN apt update
#RUN apt install apt-transport-https ca-certificates -y
#COPY ./aliyun.list /etc/apt/sources.list
RUN apt update

COPY ./install.sh /install.sh
RUN sh /install.sh
COPY ./nginx.conf /usr/local/nginx/conf/nginx.conf

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
