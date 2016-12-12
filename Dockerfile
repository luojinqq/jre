FROM debian:jessie
MAINTAINER Matt Hartstonge <matt@mykro.co.nz>
ENV JAVA_VERSION "8u66"
ENV BUILD_VERSION "b17"
ENV JDK_VERSION "1.8.0_66"
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    && mkdir -p /usr/lib/jvm \
    && cd /usr/lib/jvm \
    && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}-${BUILD_VERSION}/server-jre-${JAVA_VERSION}-linux-x64.tar.gz" \
    && tar -zxvf server-jre-${JAVA_VERSION}-linux-x64.tar.gz \
    && rm /usr/lib/jvm/server-jre-${JAVA_VERSION}-linux-x64.tar.gz \
    && ln -s /usr/lib/jvm/jdk${JDK_VERSION}/bin/java /bin/ \
    && cd /usr/lib/jvm/jdk${JDK_VERSION} \
    && find . -type f -name '*.html' -delete \
    && find . -type f -name '*.bat' -delete \
    && find . -type f -name 'COPYRIGHT' -delete \
    && find . -type f -name 'LICENSE' -delete \
    && find . -type f -name 'NOTICE' -delete \
    && find . -type f -name '3RDPARTY' -delete \
    && find . -type f -name 'THIRDPARTYLICENSE.txt' -delete \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
