FROM mysql:9.0.1
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=hr_db
ENV MYSQL_USER=hr_user
ENV MYSQL_PASSWORD=password
COPY ./init.sql /docker-entrypoint-initdb.d/
EXPOSE 3306
