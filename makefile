docker_name = wordpress-base-php-fpm
docker_webserver = wordpress-base-webserver
docker_mysql = wordpress-base-mysql
docker_image = wordpressbase_php-fpm
docker_nodejs = wordpress-base-nodejs

help: #prints list of commands
	@cat ./makefile | grep : | grep -v "grep"

show_containers: #start docker container #
	@sudo sudo docker ps

start: #start docker container #
	@sudo docker-compose up -d

stop: #stop docker container
	@sudo docker-compose down

remove: #remove docker image
	@sudo docker-compose down; sudo docker rmi -f $(docker_image)

install_wordpress: load_wordpress config_wordpress chmod
	echo "install WP was finished."
load_wordpress: #
	@sudo docker exec -it $(docker_name) bash -c 'wget -c http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rsync -av wordpress/* ./public/ && rm latest.tar.gz && rm -rf wordpress/'

config_wordpress: rewrite_wordpress_config
	echo "WP was config"

rewrite_wordpress_config: #
	@sudo docker exec -it $(docker_name) bash -c 'sed -f sedscript <./public/wp-config-sample.php > ./public/wp-config.php'

composer_update: #update vendors
	@sudo docker exec -it $(docker_name) bash -c 'php composer.phar update && chmod -R 777 . && php composer.phar dump-autoload'

composer_dump: #update vendors
	@sudo docker exec -it $(docker_name) bash -c 'php composer.phar dump-autoload'

set_env: #set default environments
	@cp ./.env.example ./.env

chmod: #allow RW to all
	@sudo docker exec -it $(docker_name) bash -c 'chmod -R 777 .'

connect: #connect to container bash
	@sudo docker exec -it $(docker_name) bash

connect_mysql: #connect to container bash
	@sudo docker exec -it $(docker_mysql) bash

connect_nodejs: #connect to container bash
	@sudo docker exec -it $(docker_nodejs) bash

volumes: #docker volumes list
	@sudo docker volume ls

rm_volume: #remove docker volume name=[volumeName]
	@sudo docker-compose down && sudo docker volume rm $(name)

populate_vendors: #generate dock
	@sudo docker exec -it $(docker_name) bash -c 'cp -R ./vendor ./ven && chmod -R 777 .' && sudo sh -c 'rm -R ./vendor; mv ./ven ./vendor'

mix_watch: #run mix in watch
	@sudo docker exec -it $(docker_nodejs) bash -c 'npm run watch && chmod -R 777 .'

clean_log:
	@sudo cat /dev/null > storage/logs/laravel.log; sudo cat /dev/null > storage/logs/queue-worker.log
