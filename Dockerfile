# Stage 1 — Build the WAR file
FROM maven:3.9.6-eclipse-temurin-11 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn clean package -DskipTests -B

# Stage 2 — Run with Tomcat
FROM tomcat:10.1-jre11

# Remove ALL default Tomcat webapps including ROOT
RUN rm -rf /usr/local/tomcat/webapps/*

# Extract WAR directly into ROOT directory (more reliable than ROOT.war)
RUN mkdir -p /usr/local/tomcat/webapps/ROOT
COPY --from=build /app/target/cemk-portal.war /tmp/cemk-portal.war
RUN cd /usr/local/tomcat/webapps/ROOT && jar -xf /tmp/cemk-portal.war && rm /tmp/cemk-portal.war

# Startup script — replaces Tomcat port with Railway's $PORT
RUN printf '#!/bin/bash\nset -e\nPORT=${PORT:-8080}\nsed -i "s/port=\\"8080\\"/port=\\"${PORT}\\"/g" /usr/local/tomcat/conf/server.xml\necho "Starting Tomcat on port $PORT"\nexec catalina.sh run\n' > /start.sh && chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
