FROM izotecarlitos/libredte-base:latest

RUN wget -c https://github.com/SowerPHP/sowerpkg/raw/master/sowerpkg.sh -P /tmp \
    && chmod +x /tmp/sowerpkg.sh \
    && /tmp/sowerpkg.sh install -e "app general" -W \
    && rm /tmp/sowerpkg.sh 

RUN git clone --recursive https://github.com/LibreDTE/libredte-webapp.git /var/www/html/libredte \
    && cd /var/www/html/libredte/website \
    && mkdir -p data/logos \
    && mkdir -p data/firma_electronica \
    && mkdir -p data/static/contribuyentes \
    && $HOME/bin/composer install \
    && chown -R www-data:www-data /var/www/html/libredte

RUN service apache2 restart
