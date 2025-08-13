# Use an official NGINX image as the base
FROM nginx:alpine

# Copy our custom index.html file to the NGINX web server directory
COPY index.html /usr/share/nginx/html

# Tell Docker that the container listens on port 80
EXPOSE 80

# The command to start the NGINX web server when the container starts
CMD ["nginx", "-g", "daemon off;"]