FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run builder
EXPOSE 80
FROM nginx
COPY --from=builder /app/dist /usr/share/nginx/html
Expose 8000
