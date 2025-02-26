command := "up -d"
project := "chatbi"
port := "8000"

docker command:
    #!/usr/bin/env bash
    set -euxo pipefail
    cmd={{command}}
    if [ "$cmd" = "up" ]; then \
        cmd="up -d"; \
    fi
    pushd ./docker &&
    export COMPOSE_PROJECT_NAME={{project}} && docker compose $cmd
    popd

    if [ "$cmd" = "down" ]; then \
        rm -rf ./docker/database; \
    fi

dev-client:
    @echo "Running dev client"
    pnpm run -C packages/client dev

dev-server:
    uv run fastapi dev chatbi/main.py --port {{port}}


# update the api spec for the client
gen-api:
    pnpm run -C packages/client api:init


default:
    @just --list --unsorted


install *args:
    uv sync {{args}}

pre-commit-install:
    uv run pre-commit install

run:
    uv run fastapi run chatbi/main.py --port {{port}}

cli *args:
    uv run python -m chatbi.cli {{args}}

example *args:
    uv run python -m chatbi.cli example {{args}}

# run the pytest tests for the given marker
test:
    uv run pytest -s

lint:
    uv run ruff format -q . --check
    uv run ruff check .

format:
# alias for `format`
fmt:
    uv run ruff format .
    uv run ruff check --fix .
    taplo fmt
