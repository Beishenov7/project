# Use the official Node.js image as a base image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Set environment variables (optional, for demonstration purposes)
ENV PORT=3001

# Expose the port the app runs on
EXPOSE 3001

# Command to run the application
CMD [ "npm", "start" ]

