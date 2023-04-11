#BUILDER phase
FROM node:14-alpine as builder 

WORKDIR '/app'

COPY . .

RUN npm run build

# /app/build <---- all the builded stuff


#RUN phase
FROM nginx

#copy build files from builder to ngnix usr/share/ngnix/html
COPY --from=builder /app/build /usr/share/nginx/html