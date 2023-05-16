# Use the official Node.js 18.16.0 image as the base
FROM node:18.16.0

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application's code
COPY . .

# Expose the port used by the application (3000 in this case)
EXPOSE 3000

# Build the application
CMD ["npm", "run", "build"]
