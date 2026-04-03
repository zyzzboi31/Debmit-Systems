# Stage 1 — Build the WAR file
FROM maven:3.9.6-eclipse-temurin-11 AS build

WORKDIR /app

# Copy pom.xml first (Docker cache optimization)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code and build
COPY src ./src
RUN mvn clean package -DskipTests -B

# Stage 2 — Run with Tomcat
FROM tomcat:10.1-jre11

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy built WAR into Tomcat
COPY --from=build /app/target/cemk-portal.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
