FROM node:alpine AS builder
WORKDIR  '/usr/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# this is the directory in the container that will all the production files -> /usr/app/build

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html
