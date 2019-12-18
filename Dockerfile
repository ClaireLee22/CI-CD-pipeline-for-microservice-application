FROM nginx

# Copy source code to working directory
COPY index.html /usr/share/nginx/html

# Allow microscanner to make an HTTPS connection
RUN apt-get update && apt-get -y install ca-certificates
