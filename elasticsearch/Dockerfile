FROM alpine:3.7

RUN apk update && apk --no-cache add wget bash\
    openjdk8-jre \
    su-exec \
    ca-certificates \ 
    && cd /tmp \
    && wget --progress=bar:force -O elasticsearch.tar.gz "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.16.tar.gz" \
    && tar -xf elasticsearch.tar.gz \
    && mkdir -p /usr/share/elasticsearch \
    && mv elasticsearch-5.6.16/* /usr/share/elasticsearch \
    && adduser -D -h /usr/share/elasticsearch elasticsearch
RUN sed -ie 's/-Xms2g/-Xms256m/g' /usr/share/elasticsearch/config/jvm.options
RUN sed -ie 's/-Xmx2g/-Xmx256m/g' /usr/share/elasticsearch/config/jvm.options
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
ENV PATH /usr/share/elasticsearch/bin:$PATH
COPY elasticsearch.sh /usr/local/bin/elasticsearch.sh

RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch
    
CMD ["sh","/usr/local/bin/elasticsearch.sh"]
