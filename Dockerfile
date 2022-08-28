# Set Node alpine as base image
FROM node:16-alpine

# Move into project directory
WORKDIR /project

# Install node packages and update path
COPY package.json package-lock.json* ./
RUN npm install
ENV PATH=/project/node_modules/.bin:$PATH

#go to where source files are
WORKDIR /project/app

# Copy source files into container
COPY . .

# Start this script first
ENTRYPOINT [ "./entrypoint.sh" ]

# Start the app
CMD ["npm", "run", "dev"]