FROM nginx:stable

WORKDIR /usr/share/nginx/html

COPY index.html ./index.html

EXPOSE 80
