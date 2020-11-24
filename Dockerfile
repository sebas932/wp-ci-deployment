FROM php:7.4-apache
MAINTAINER Sebastian Amariles

#
# Install basic requirements
#
RUN apt-get update \
 && apt-get install -y \
 curl \
 apt-transport-https \
 git \
 build-essential \
 libssl-dev \
 wget \
 unzip \
 bzip2 \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#
# Install Node (with NPM), Yarn AND Gulp (via package manager for Debian)
#
# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update \
 && apt-get install -y \
 nodejs
RUN npm install -g yarn && npm install --g gulp-cli && npm rebuild node-sass


COPY test.sh /test.sh