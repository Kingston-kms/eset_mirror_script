# Version: 0.0.1

# Используем за основу контейнера Ubuntu 18.04 LTS
FROM ubuntu:18.04

# Переключаем Ubuntu в неинтерактивный режим — чтобы избежать лишних запросов
ENV DEBIAN_FRONTEND noninteractive 

# Добавляем необходимые репозитарии и устанавливаем пакеты
RUN apt-get update
RUN apt-get install -y wget curl git unrar-free cron php php-curl mc tzdata
RUN apt-get clean

# Устанавливаем локаль
#RUN locale-gen ru_RU.UTF-8 && dpkg-reconfigure locales

# Устанавливаем время
RUN ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime

# Установка скрипта nod32mirror
RUN git clone https://github.com/limbpro/eset_mirror_script.git
RUN mv ./eset_mirror_script /home/
RUN mkdir -p /var/www/nod32mirror
RUN mkdir -p /home/eset_mirror_script/logs
RUN mkdir -p /home/eset_mirror_script/logs/log_script
RUN find /home/eset_mirror_script -type f -name '*.php' -exec chmod +x {} \;


# Настройка cron
RUN echo '0 */1 * * * root /usr/bin/php /home/eset_mirror_script/update.php --update >> /home/eset_mirror_script/logs/log_cron.txt' > /etc/crontab
RUN touch /home/eset_mirror_script/logs/log_cron.txt

# Запускаем cron
CMD ["cron", "-f"]
