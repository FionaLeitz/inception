if [ ! -f /var/www/html/wp-config.php ]; then
        until mysqladmin -hmariadb -u${MYSQL_USER} -p${MYSQL_USER_PASSWORD} ping; do
                sleep 2
        done
                cd /var/www/html/ && wp core download --allow-root
                wp config create --dbname=${MYSQL_DATABASE} \
                        --dbuser=${MYSQL_USER} \
                        --dbpass=${MYSQL_USER_PASSWORD} \
                        --dbhost=mariadb:3306 \
                        --dbcharset="utf8" \
                        --dbcollate="utf8_general_ci" \
                        --allow-root
                        # --path='var/www/wordpress'

                        wp core install --url=fleitz.42.fr \
                                --title=${WP_TITLE} \
                                --admin_user=${MYSQL_ADMIN} \
                                --admin_password=${MYSQL_ADMIN_PASSWORD} \
                                --admin_email=${MYSQL_ADMIN_MAIL} \
                                --skip-email \
                                --allow-root

                        wp user create ${MYSQL_USER} \
                                ${MYSQL_USER_MAIL} \
                                --allow-root \
                                --role=author \
                                --user_pass=${MYSQL_USER_PASSWORD}

fi

php-fpm7.3 -F -R
