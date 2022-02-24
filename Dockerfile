FROM nginx:alpine
RUN ls -lra /usr/share/nginx/html
COPY site/public /usr/share/nginx/html
RUN ls -lra /usr/share/nginx/html
