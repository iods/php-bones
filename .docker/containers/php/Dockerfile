ARG VERSION
FROM php:${VERSION}-fpm

LABEL maintainer="containers@darksociety.cloud"

ARG DEBIAN_FRONTEND=noninteractive
ARG NODE
ARG UID
ARG USER

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN \
    set -xeu \
    && apt-get update -q \
    && apt-get install -qq -y \
        curl \
        git \
        unzip \
        zip; \
    install-php-extensions \
        bcmath \
        gd \
        redis; \
    apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN \
    # curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    apt-get update \
    && apt-get install -y \
        nodejs-dev \
        node-gyp \
        libssl1.0-dev; \
    apt-get install -y \
        nodejs \
        npm


COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_MEMORY_LIMIT -1
ENV PATH bin:vendor/bin:$PATH

RUN chmod +x /usr/local/bin/composer

RUN \
    useradd -G www-data,root -u ${UID} -d /home/${USER} ${USER}; \
    mkdir -p /home/${USER}/.composer \
    && chown -R ${USER}:${USER} /home/${USER}

WORKDIR /var/www

USER ${USER}