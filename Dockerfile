FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

#RUN npm install
# If you are building your code for production
RUN mkdir dist && npm install && npm run-script build

COPY server.js ./ 
COPY index.html dist/

# Bundle app source
#npm COPY ccpwgl2/`. .

WORKDIR /usr/src/app/dist

EXPOSE 3000
CMD [ "npm", "start" ]