FROM phpdockerio/php72-fpm:latest
WORKDIR "/application"

# Install selected extensions and other stuff
RUN apt-get update && \
	apt-get install -y apt-utils && \
    apt-get install -y unzip && \
	apt-get install -y libzip-dev && \
	apt-get install -y libpng-dev && \
    apt-get install -y git && \
    apt-get install -y cron && \
    apt-get install -y --no-install-recommends php7.2-mysql php7.2-sqlite3 php7.2-gd php-imagick php-memcached && \
    apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY ./ /application

RUN (crontab -l ; echo "* * * * * /usr/local/bin/php /application/artisan schedule:run >>/dev/null 2>&1") | crontab

EXPOSE 9090
