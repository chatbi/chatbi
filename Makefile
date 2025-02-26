# Variables
COMMAND := up -d
PROJECT := chatbi
PORT    := 8000

.PHONY: docker dev-client default install pre-commit-install run dev cli example test lint format fmt

docker:
	@set -euxo pipefail; \
	cmd="$(COMMAND)"; \
	if [ "$$cmd" = "up" ]; then \
		cmd="up -d"; \
	fi; \
	pushd ./docker > /dev/null && \
	export COMPOSE_PROJECT_NAME=$(PROJECT) && docker compose $$cmd && \
	popd > /dev/null; \
	if [ "$$cmd" = "down" ]; then \
		rm -rf ./docker/database; \
	fi

dev-client:
	@echo "Running dev client"
	@pnpm run -C packages/client dev

dev-server:
	@echo "Running dev server"
	uv run fastapi dev chatbi/main.py --port $(PORT)


# update the api spec for the client
gen-api:
	@echo "Updating API spec"
	pnpm run -C packages/client api:init

default:
	@echo "Available targets: docker, dev-client, install, pre-commit-install, run, dev, cli, example, test, lint, format (fmt)"

# To pass extra arguments, call with: make install ARGS="arg1 arg2 ..."
install:
	uv sync $(ARGS)

pre-commit-install:
	uv run pre-commit install

run:
	uv run fastapi run chatbi/main.py --port $(PORT)


# To pass extra arguments, call with: make cli ARGS="your args"
cli:
	uv run python -m chatbi.cli $(ARGS)

# To pass extra arguments, call with: make example ARGS="your args"
example:
	uv run python -m chatbi.cli example $(ARGS)

test:
	uv run pytest -s

lint:
	uv run ruff format -q . --check
	uv run ruff check .

format: fmt

fmt:
	uv run ruff format .
	uv run ruff check --fix .
	taplo fmt