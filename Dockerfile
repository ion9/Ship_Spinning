FROM node:13 as build
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json dist* ./
# If you are building your code for production
RUN npm install && npm run-script setup
# Copy our custom index.html 
COPY index.html ./dist/
# Build the final image used to serve them
FROM nginx:1.14.0
COPY --from=build /usr/src/app/dist* /usr/share/nginx/html/