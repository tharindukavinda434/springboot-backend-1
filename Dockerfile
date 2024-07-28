# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Maven
RUN apt-get update && apt-get install -y maven

# Package the application
RUN mvn clean package -DskipTests

#port expose
EXPOSE 8080

# Specify the JAR file and the command to run it
ENTRYPOINT ["java","-jar","target/springboot-backend-0.0.1-SNAPSHOT.jar"]