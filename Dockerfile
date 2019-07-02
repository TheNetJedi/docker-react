FROM node:alpine as buildstage
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=buildstage /app/build /usr/share/nginx/html
EXPOSE 80
