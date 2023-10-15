# Use Node 16 alpine as parent image
FROM node:16-alpine

# ENV DB_URL='localhost'
# ENV DB_NAME='DatabaseName'
# ENV DB_USER='postgres'
# ENV DB_PASSWORD='password'
# ENV DB_PORT=5431
# ENV MQTT_URL='localhost'
# ENV MQTT_PORT='1883'
# ENV PORT=8000

# Change the working directory on the Docker image to /app
WORKDIR /usr/src/app
# Copy package.json and package-lock.json to the /app directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install && npm install typescript -g

# Copy the rest of project files into this image
COPY . .

RUN tsc


# Expose application port
EXPOSE ${PORT}

# Start the application
CMD ["node", "./server.js"]

