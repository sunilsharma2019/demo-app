# Small nginx image that serves a page showing which build it came from.
FROM nginx:1.27-alpine

# Passed in by the CI pipeline (short commit SHA). "dev" when built by hand.
ARG BUILD_TAG=dev

COPY index.html /usr/share/nginx/html/index.html

# Stamp the build tag into the page so each rollout is visible in the browser.
RUN sed -i "s/__BUILD_TAG__/${BUILD_TAG}/" /usr/share/nginx/html/index.html
