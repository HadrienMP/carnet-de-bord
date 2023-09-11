# -------------------------------------
# Install
# -------------------------------------
#
## Installe toutes les dépendances (front, back et tests)
install: install-app install-backend install-e2e
	-cp -n .env.sample .env
	-cp -n .env.test.sample .env.test
	pre-commit install

install-app:
	cd app && \
		npm install

install-backend:
	cd backend; \
		poetry install

install-e2e:
	cd e2e; \
		npm install

# -------------------------------------
# Start
# -------------------------------------
start-app: ## Démarre l'app frontend
	cd app; \
		npm run dev

start-backend: ## Démarre le backend
	cd backend; \
		poetry run uvicorn --reload --host '' cdb.api.main:app

start-storybook: ## Démarre storybook
	cd app && npm run dev:storybook

start:
	devbox services up

kill:
	devbox services stop

# --------------------------------------
#  Test
# --------------------------------------
test-backend: ## Lance les tests du backend
	./scripts/launch_tests.sh python

test-backend-watch: ## Lance les tests du backend en mode watch
	./scripts/launch_tests.sh
	cd backend && \
		ENV_FILE=../.env.test poetry run ptw --runner "pytest --testmon"

test-app:
	cd app && \
		npm run test

test-approve-all:
	./scripts/approve-all.sh

# Launches the the e2e tests, flags: --no-build and --ui
test-e2e *FLAGS:
	cd ./my && \
		poetry run e2e {{FLAGS}}

svelte-test *FLAGS:
	cd app && npx vitest {{FLAGS}}
svelte-check:
	cd app && npm run check

# -------------------------------------
# End to end tests
# -------------------------------------

e2e-extract-vocabulary: ## E2E: Generates all the supported vocabulary in a file
	./scripts/extract-e2e-vocabulary.sh

e2e-run: ## E2E: Launches the end to end tests
	./scripts/launch_tests.sh e2e

e2e-named title:
	cd e2e && \
		CODECEPT_UI=true npm test -- --grep "{{title}}" -p pauseOnFail

e2e:
	process-compose -f test-e2e.yml

start-test-app:
	./scripts/shdotenv {{justfile_directory()}}/.env.test && \
	cd app && \
	npm run dev -- --port 3001

start-test-backend:
	./scripts/shdotenv {{justfile_directory()}}/.env.test && \
	echo ${HASURA_GRAPHQL_DATABASE_URL}
	# cd backend && \
	# poetry run uvicorn cdb.api.main:app --host localhost --port 8001

# -------------------------------------
# Other
# -------------------------------------
hasura-console *FLAGS: ## Lance la console hasura
	hasura --project ./hasura/ console {{FLAGS}}

seed: seed-database
seed-database: ## Ajoute les données de test dans la base de donnée
	hasura --project ./hasura seed apply --database-name carnet_de_bord

update-schema: ## Met à jour le fichier de schéma graphql
	./scripts/update-schema.sh

codegen: update-schema
	# Nothing to do, code gen is automatically run on build

# -------------------------------------
# Elm
# -------------------------------------

elm-check: elm-compiles elm-test elm-review ## Elm: Vérifie que le code Elm est prêt à être poussé sur le repository

# Launches the tests, flags: --watch
elm-test *FLAGS:
	cd app && \
		npm run test:elm -- {{FLAGS}}

elm-compiles: ## Elm: Vérifie que toutes les apps Elm compilent
	bash ./scripts/all-elm-compiles.sh

# Launches elm-review, flags: suppress, --fix, --fix-all
elm-review *FLAGS: ## Elm: Lance un diagnostic
	cd app && \
		npm run lint:elm-review {{FLAGS}}

# -------------------------------------
# Hasura
# -------------------------------------

hasura-migrate-up:
	hasura migrate apply --project hasura

hasura-migrate-down:
	hasura migrate apply --down 1 --project hasura

hasura-migrate-status:
	hasura migrate status --project hasura $(ARGS)

hasura-migrate-metadata-apply:
	hasura metadata apply --project hasura

hasura-migrate-create:
	hasura migrate create ${NAME} --project hasura $(ARGS)

