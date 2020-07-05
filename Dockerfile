FROM alpine:3.12.0

# Install optipng & jpegoptim
RUN apk update \
    && apk add --no-cache optipng jpegoptim file

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
