ARG PHP_VER
ARG EMAIL

FROM ${PHP_VER}

MAINTAINER Dominic ${EMAIL}

RUN apt-get update \
 && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    zip \
    git

RUN docker-php-ext-install \
  zip

ARG COMP_VER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMP_VER}

RUN composer global require squizlabs/php_codesniffer:^3.4 \
  && composer global require magento/magento-coding-standard \
  && composer global require dealerdirect/phpcodesniffer-composer-installer \
  && mkdir -p /code

ENV PATH="/root/.composer/vendor/squizlabs/php_codesniffer/bin:${PATH}"

RUN phpcs --config-set installed_paths /root/.composer/vendor/magento/magento-coding-standard,/root/.composer/vendor/phpcompatibility/php-compatibility

WORKDIR /code
VOLUME /code
