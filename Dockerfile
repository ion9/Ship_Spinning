FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Set the username we will run as
ENV user appuser

#RUN npm install
# If you are building your code for production
RUN mkdir dist && npm install && npm run-script build && groupadd --system $user && useradd --system --gid $user $user

COPY server.js ./ 
COPY index.html dist/

WORKDIR /usr/src/app/dist

# Switch to the non-root user
USER $user
EXPOSE 3000
CMD [ "npm", "start" ]