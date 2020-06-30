FROM tomcat:alpine
MAINTAINER Anamika_assignment
RUN wget -O /usr/local/tomcat/webapps/anamika_assignment.war
http://10.127.130.66:8040/artifactory/webapp/#/artifacts/browse/tree/General/test-pipeline/com/example/java-tomcat-maven-example/1.0-SNAPSHOT/java-tomcat-maven-example-1.0-SNAPSHOT.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run



