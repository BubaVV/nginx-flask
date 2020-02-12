FROM nginx:1.16.1

COPY nginx_flask.conf /etc/nginx/conf.d/default.conf