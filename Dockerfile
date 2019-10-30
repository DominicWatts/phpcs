
FROM php:7.1-cli

RUN echo 'alias phpcs="~/.composer/vendor/squizlabs/php_codesniffer/bin/phpcs"' >> ~/.bashrc
RUN echo 'alias phpcbf="~/.composer/vendor/squizlabs/php_codesniffer/bin/phpcbf"' >> ~/.bashrc

MAINTAINER Dominic <dominic@xigen.co.uk>

RUN apt-get update \
 && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    git

RUN docker-php-ext-install \
  zip

VOLUME /root/.composer/cache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer global require squizlabs/php_codesniffer:^3.4

RUN composer global require magento/magento-coding-standard

RUN composer global require dealerdirect/phpcodesniffer-composer-installer

ENV PATH="/root/.composer/vendor/squizlabs/php_codesniffer/bin:${PATH}"

VOLUME ["/project"]

WORKDIR /project

ENTRYPOINT ["phpcs"]

CMD ["--version"]