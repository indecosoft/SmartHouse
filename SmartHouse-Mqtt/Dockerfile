# Use Node 16 alpine as parent image
FROM node:16-alpine

# Change the working directory on the Docker image to /app
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the /app directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install\
 && npm install typescript -g

# Copy the rest of project files into this image
COPY . .

RUN tsc

# Expose application port
EXPOSE 1883

# Start the application
CMD ["node", "./index.js"]
