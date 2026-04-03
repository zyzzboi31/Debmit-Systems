# Stage 1 — Build the WAR file
FROM maven:3.9.6-eclipse-temurin-11 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn clean package -DskipTests -B

# Stage 2 — Run with Tomcat
FROM tomcat:10.1-jre11

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy built WAR into Tomcat as ROOT (serves at /)
COPY --from=build /app/target/cemk-portal.war /usr/local/tomcat/webapps/ROOT.war

# Startup script — replaces Tomcat's hardcoded 8080 with Railway's $PORT
RUN printf '#!/bin/bash\nset -e\nPORT=${PORT:-8080}\nsed -i "s/port=\\"8080\\"/port=\\"${PORT}\\"/g" /usr/local/tomcat/conf/server.xml\nexec catalina.sh run\n' > /start.sh && chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
