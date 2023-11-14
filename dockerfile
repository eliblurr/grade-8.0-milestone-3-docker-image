FROM openjdk:19-jdk-alpine

LABEL elvissegbawu <elvissegbawu@gmail.com>

# 1- add all required programs
RUN apk add --no-cache curl tar bash procps

ARG GRADLE_VERSION=8.0-milestone-3

# 3- create directories
RUN mkdir -p /usr/share/gradle /usr/share/gradle/ref

# 4- copy gradle into alpine
COPY ./gradle-8.0-milestone-3.zip /tmp/gradle.zip

# 5- Unzip and installing Gradle

RUN unzip -d /usr/share/gradle /tmp/gradle.zip
RUN rm -f /tmp/gradle.zip
RUN ln -s /usr/share/gradle/gradle-8.0-milestone-3 /usr/bin/gradle
ENV PATH=$PATH:/usr/bin/gradle/bin
# 5- Define environmental variables required by gradle
ENV GRADLE_VERSION 8.0-milestone-3
ENV GRADLE_HOME /usr/bin/gradle
ENV GRADLE_USER_HOME /cache

VOLUME $GRADLE_USER_HOME

CMD [""]