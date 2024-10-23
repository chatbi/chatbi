run-docker:
  @echo "Running docker"
  cd ./docker && docker compose up -d

dev-server:
  @echo "Running dev server"
  pnpm run dev:server

dev-client:
  @echo "Running dev client"
  pnpm run dev:client

dev: run-docker dev-server dev-client
  @echo "Running successfully"