# Get the PHP-FPM 8.2 alpine image
FROM php:8.2-fpm-alpine

# Install dependencies and extensions
RUN apk add --no-cache $PHPIZE_DEPS \
    openssl-dev \
    pkgconfig \
    autoconf \
    build-base \
    linux-headers \
    git \
    zsh \
    librdkafka-dev \
    unixodbc-dev \
    libcouchbase-dev gcc make zlib-dev cmake \
    && pecl install opcache mongodb redis xdebug opentelemetry-beta rdkafka sqlsrv pdo_sqlsrv couchbase \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable opcache mongodb redis xdebug opentelemetry rdkafka pdo_mysql sqlsrv pdo_sqlsrv couchbase

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy xdebug.ini file from local file
COPY ./docker/php/99-xdebug.ini /usr/local/etc/php/conf.d/99-xdebug.ini

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Enable git plugin for Oh My Zsh
RUN echo "plugins=(git)" >> ~/.zshrc

# Set base aliases
RUN echo "alias ll='ls -la'" >> ~/.zshrc \
    && echo "alias sf='bin/console'" >> ~/.zshrc \
    && echo "alias sfcc='bin/console cache:clear'" >> ~/.zshrc \
    && echo "alias phpunit='bin/phpunit'" >> ~/.zshrc \
    && echo "alias phpunit-ts='bin/phpunit --testsuite'" >> ~/.zshrc \
    && echo "alias phpunit-cc='bin/phpunit --coverage-text'" >> ~/.zshrc \
    && echo "alias csfixer='PHP_CS_FIXER_IGNORE_ENV=1 vendor/bin/php-cs-fixer fix'" >> ~/.zshrc \
    && echo "alias phpstan='vendor/bin/phpstan'" >> ~/.zshrc
