# Use official lightweight nginx image
FROM nginx:stable-alpine

# Install small utilities and CA certificates (so nginx can verify upstream TLS)
RUN apk add --no-cache bash gettext ca-certificates \
 && update-ca-certificates

# Remove the stock default config and replace with ours
RUN rm -f /etc/nginx/conf.d/default.conf

# Copy custom nginx configuration files into the image
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# (Optional) If you later want to serve a local build, copy it into /usr/share/nginx/html
# COPY build /usr/share/nginx/html

EXPOSE 80

# Run nginx in foreground (required for Docker)
CMD ["nginx", "-g", "daemon off;"]
