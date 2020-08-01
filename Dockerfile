FROM nginx:stable

WORKDIR /usr/share/nginx/html

COPY index.html ./index.html

RUN apt update && \
	apt install -y tidy
