                                                                                         
# Use an official Ubuntu 22.04 as a base image
FROM ubuntu:22.04


# Install Node.js
RUN apt-get update && apt-get install -y nodejs npm curl wget net-tools

 
# Set the working directory
WORKDIR /app

 

# Copy the package.json and package-lock.json files
COPY package*.json ./

 

# Install the dependencies
RUN npm install

 

# Copy the application code
COPY . .

 

# Make nodemon binary executable
RUN chmod +x /app/node_modules/nodemon/bin/nodemon.js
RUN chmod +x /app/node_modules/.bin/nodemon
# Expose the app port
EXPOSE 3000

 

# Set the command to start the application
CMD ["npm", "start"]
