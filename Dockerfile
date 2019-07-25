FROM node:10

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install --production
RUN npm install pm2 -g
# Copy app
COPY . /usr/src/app


# Expose for api
EXPOSE 3002

CMD [ "node", "index.js"]