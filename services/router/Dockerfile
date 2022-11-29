FROM nginx:stable
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY prep.sh .
RUN ./prep.sh
