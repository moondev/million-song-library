FROM        cassandra:2.1.11
MAINTAINER  aramirez@kenzan.com

RUN apt-get update; apt-get install -y nmap

COPY    ./tools                   ~/million-song-library/tools
COPY    ./bin                     ~/million-song-library/bin

WORKDIR ~/million-song-library/tools/cassandra

COPY populate.py /populate.py

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

RUN mkdir -p /var/lib/cassandra "$CASSANDRA_CONFIG" \
	&& chown -R cassandra:cassandra /var/lib/cassandra "$CASSANDRA_CONFIG" \
	&& chmod 777 /var/lib/cassandra "$CASSANDRA_CONFIG"


# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
EXPOSE 7000 7001 7199 9042 9160
CMD ["cassandra", "-f"]