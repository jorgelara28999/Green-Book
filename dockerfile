FROM httpd:2.4-alpine 

WORKDIR /usr/share/nginx/html
COPY . .
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

