FROM nginx:latest
LABEL maintainer=sayankc@outlook.com
#execute this command before -- echo "Hello skc-nginx. Deployment $var" > index.html
COPY index.html /usr/share/nginx/html/index.html
RUN chmod +x /usr/share/nginx/html/index.html
