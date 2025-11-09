FROM denoland/deno:2.5.4
WORKDIR /app
COPY . .
RUN deno task build
RUN deno cache main.ts
ENV PORT=8000
USER deno
CMD ["deno", "run", "--allow-net", "--allow-read", "--allow-env", "main.ts"]
