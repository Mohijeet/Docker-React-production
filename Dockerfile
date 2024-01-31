FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.jso .
RUN npm install 
COPY . .
RUN npm run builder

FROM nginx
COPY --from=builder /app/dist /usr/share/nginx/html
