FROM php:7.4-fpm

LABEL maintainer="containers@darksociety.cloud"

ARG DEBIAN_FRONTEND=noninteractive

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
        redis \
        xdebug; \
    apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_MEMORY_LIMIT -1
ENV PATH bin:vendor/bin:$PATH

RUN chmod +x /usr/local/bin/composer

# Install Node and NPM
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && apt-get install nodejs
# RUN npm i -g yarn


# Configure PHP
RUN cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini
COPY ./conf.d $PHP_INI_DIR/conf.d

# Configure Git
RUN git config --global user.email "email@email.com" \
    && git config --global user.name "User Name"


WORKDIR /var/www