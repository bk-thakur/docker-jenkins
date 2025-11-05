# FROM openjdk:21
# WORKDIR /app
# COPY target/myapp.jar app.jar
# ENTRYPOINT ["java", "-jar", "app.jar"]


FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g","daemon off;"]
