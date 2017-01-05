FROM openjdk:8
MAINTAINER Rafael Hoff <rafael.hoff@gmail.com>

RUN mkdir /opt/dynamodb_local
RUN mkdir /var/dynamodb_data
RUN wget -q -O - http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz | tar -xzf - -C /opt/dynamodb_local

WORKDIR /opt/dynamodb_local
VOLUME ["/var/dynamodb_data"]
EXPOSE 8000

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=/opt/dynamodb_local/DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb", "-dbPath", "/var/dynamodb_data"]
