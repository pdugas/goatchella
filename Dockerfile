FROM nginx:alpine
RUN ps -lra /usr/share/nginx/html
COPY site/public /usr/share/nginx/html
RUN ps -lra /usr/share/nginx/html
