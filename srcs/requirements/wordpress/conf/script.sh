# on devrait attendre un peu pour etre sur
# que la base de donnees MariaDB soit lancee
# puis faire la suite seulement si wp-config.php n'existe pas
# sinon faut tout le temps recommencer

wp config create --allow-root \
        --dbname=${SQL_DATABASE} \
        --dbuser=${SQL_USER} \
        --dbpass=${SQL_USER_PASSWORD} \
        --dbhost=mariadb:3306 \
        --path='var/www/wordpress'

wp core install --allow-root \
        --url=fleitz.42.fr \
        --title=${WP_TITLE} \
        --admin_user=${SQL_ADMIN} \
        --admin_password=${SQL_ADMIN_PASSWORD} \
        --admin_email=${SQL_ADMIN_MAIL} \
        --skip_email

wp user create --allow-root \
        ${SQL_USER} \
        ${SQL_USER_MAIL} \ 
        --role=author \
        --user_pass=${SQL_USER_PASSWORD}

php-fpm7.3 -F
