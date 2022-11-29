FROM nginx:mainline-alpine
RUN rm /etc/nginx/conf.d/*
COPY hello.conf /etc/nginx/conf.d/default.conf.template
ADD index.html /usr/share/nginx/html/
COPY docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
