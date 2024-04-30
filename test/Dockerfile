# FROM gcr.io/distroless/base-debian11
FROM debian

WORKDIR /app

COPY --from=xedom/codeduel-be /usr/local/bin/codeduel-be /usr/local/bin/codeduel-be
COPY --from=xedom/codeduel-lobby /usr/local/bin/codeduel-lobby /usr/local/bin/codeduel-lobby
COPY --from=xedom/codeduel-runner /usr/local/bin/codeduel-runner /usr/local/bin/codeduel-runner
COPY --from=xedom/codeduel-runner /app/docker_setup.sh /app/docker_setup.sh

RUN apt-get update && apt-get install -y docker.io
# COPY docker docker

COPY ./start.sh ./start.sh
RUN chmod +x ./start.sh && chmod +x /app/docker_setup.sh

ENV ENV=production
ENV HOST="0.0.0.0"
ENV JWT_SECRET="xxxxxxxxxxxxxxxx"
ENV SERVICE_TOKEN="cd-token-secret"

ENV BACKEND_URL="http://localhost:5000"
ENV BACKEND_API_KEY="cd-token-secret"

ENV RUNNER_URL="http://localhost:5020"
ENV RUNNER_API_KEY="xxxxxxxxxxxxxxxx"

ENV DOCKER_IMAGE_PREFIX="cd-runner-"
ENV DOCKER_TIMEOUT="5s"

EXPOSE 5000
EXPOSE 5010
# EXPOSE 5020

CMD ./docker_setup.sh && ./start.sh
