FROM node:alpine AS builder

WORKDIR "/app"

COPY package.json .
RUN npm i
COPY . .

RUN ["npm", "run", "build"]

#all results of prev FROM block will be treminated

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html