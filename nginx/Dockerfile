FROM debian:buster-slim
MAINTAINER Akifumi Niida <nidstyle3@gmail.com>
RUN apt-get update && apt-get install nginx -y
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]