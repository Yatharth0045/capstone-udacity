FROM nginx:stable

MAINTAINER Yatharth Sharma

WORKDIR /usr/share/nginx/html

COPY index.html ./index.html

EXPOSE 80
