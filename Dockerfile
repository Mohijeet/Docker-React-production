FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run builder

FROM nginx
COPY --from=builder /app/dist /usr/share/nginx/html
Expose 80
