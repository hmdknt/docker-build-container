##### MySQL5.7 #####
FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD password

##### Version Management #####
ARG JDK_KIND='openjdk-8-jdk'

##### OpenJDK8 #####
RUN apt-get update && \
    mkdir -p /usr/share/man/man1 && \
    apt-get -y install $JDK_KIND