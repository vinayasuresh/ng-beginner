# Dockerfile
FROM node:18 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Production image
FROM nginx:alpine
COPY --from=build-stage /app/dist/ng-beginner /usr/share/nginx/html

