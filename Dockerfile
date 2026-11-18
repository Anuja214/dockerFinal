FROM nginx:alpine

ARG APP_VERSION=dev

LABEL org.opencontainers.image.title="Weatherly" \
      org.opencontainers.image.version="${APP_VERSION}" \
      org.opencontainers.image.description="Static weather information demo"

COPY index.html styles.css /usr/share/nginx/html/
RUN printf '{"version":"%s"}\n' "$APP_VERSION" > /usr/share/nginx/html/version.json

EXPOSE 80
