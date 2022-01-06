FROM nginx:1.20

LABEL maintainer="containers@darksociety.cloud"

COPY default.conf.template /
RUN \
    sed -i 's/${SERVER_NAME}/php.test/g' /default.conf.template \
    && sed -i 's/${DOC_ROOT}/\/var\/www/g' /default.conf.template \
    && cp default.conf.template /etc/nginx/conf.d/default.conf

WORKDIR /var/www