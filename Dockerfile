FROM denoland/deno:2.5.4

ARG GIT_REVISION
ENV DENO_DEPLOYMENT_ID=${GIT_REVISION}

EXPOSE 8000

WORKDIR /app

COPY . .
RUN deno cache main.ts --import-map=import_map.json

CMD ["run", "-A", "main.ts"]