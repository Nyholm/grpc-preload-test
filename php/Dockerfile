FROM php:8.3.8-fpm-alpine3.20 as base

ENV BIN_PATH="/usr/local/bin" \
    APP_PATH="/var/www/html" \
    PATH="/home/docker/src/.bin:/home/docker/src/composer/vendor/bin:$PATH"

WORKDIR $APP_PATH

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions ${BIN_PATH}/install-php-extensions

RUN adduser -D docker
RUN chown -R docker:docker "${APP_PATH}"
RUN install-php-extensions opcache protobuf grpc

# Copy PHP configuration
COPY --chown=docker:docker php/php.ini /usr/local/etc/php/php.ini
COPY --chown=docker:docker php/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY --chown=docker:docker php/www.conf /usr/local/etc/php-fpm.d/www.conf

USER docker

COPY --chown=docker:docker app/. "${APP_PATH}"

STOPSIGNAL SIGTERM