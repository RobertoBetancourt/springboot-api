# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="rob_betancourt@hotmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8141

# The application's jar file
ARG JAR_FILE=target/SpringBootJwtAuthentication-0.0.1.jar

# Add the application's jar to the container
ADD ${JAR_FILE} SpringBootJwtAuthentication.jar

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/SpringBootJwtAuthentication.jar"]

# docker build
# sudo docker build -t <dockerhub-user>/SpringBootJwtAuthentication .

# docker run
# sudo docker run --name <linuxuser>-api -p 8xxx:8080 -d <dockerhub-user>/SpringBootJwtAuthentication  