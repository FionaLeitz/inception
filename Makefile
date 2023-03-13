NAME	= inception

FILE	= srcs/docker-compose.yml

DOCC	= sudo docker-compose -f

all:
		mkdir -p /home/fleitz/data/mariadb
		mkdir -p /home/fleitz/data/wordpress
		${DOCC} ${FILE} up -d --build

start:
		${DOCC} ${FILE} start

stop:
		${DOCC} ${FILE} stop

status:
		${DOCC} ${FILE} ps

clean:
		${DOCC} ${FILE} down -v

fclean:	clean
		sudo rm -rf /home/fleitz/data/

re:		fclean all

.PHONY:	run start stop status clean fclean re