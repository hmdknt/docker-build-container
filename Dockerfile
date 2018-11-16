##### MySQL5.7 #####
FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD password

##### Version Management #####
ARG JDK_KIND='openjdk-8-jdk'

##### OpenJDK8 #####
RUN apt-get update && \
    mkdir -p /usr/share/man/man1 && \
    apt-get -y install $JDK_KIND
    
##### Gradle(4.10.2) #####
#RUN mkdir /opt/gradle && \
#    cd /tmp && \
#    wget https://services.gradle.org/distributions/$GRADLE_FILE && \
#    unzip -d /opt/gradle/ $GRADLE_FILE && \
#    rm -rf $GRADLE_FILE
#ENV PATH $PATH:/opt/gradle/gradle-$GRADLE-VERSION/bin
