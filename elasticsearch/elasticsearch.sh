#!/bin/sh
chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/
su - elasticsearch -c "/usr/share/elasticsearch/bin/elasticsearch"
