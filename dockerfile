FROM nginx:stable-alpine

# ensure envsubst available (optional but lightweight)
RUN apk add --no-cache bash gettext

# remove default and copy our configs
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
