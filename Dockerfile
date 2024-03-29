# Stage 1: Build the project
FROM gradle:7.3.3-jdk11 AS build
WORKDIR /app
COPY . .
RUN gradle clean build --no-daemon
# Test 
RUN gradle test --no-daemon

# Stage 2: Create the final image
FROM adoptopenjdk:11-jre-hotspot
WORKDIR /app
COPY --from=build /app/build/libs/*.jar ./
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
