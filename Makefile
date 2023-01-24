NAME	= inception

FILE	= srcs/docker-compose.yml

DOCC	= sudo docker compose -f

all:	run

run:
		sudo mkdir -p /home/fox/data
		sudo mkdir -p /home/fox/data/wp_data
		sudo mkdir -p /home/fox/data/mariadb_data
		${DOCC} ${FILE} up -d --build

start:
		${DOCC} ${FILE} start

stop:
		${DOCC} ${FILE} stop

status:
		${DOCC} ${FILE} status

clean:
		${DOCC} ${FILE} down -v
		docker rmi -f nginx wordpress mariadb_data

fclean:	clean
		sudo rm -rf /home/fox/data

re:		fclean all

.PHONY:	run start stop status clean fclean re