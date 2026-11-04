# playground-app

Throwaway test repo used by ticketwright's verification. Minimal Rails API
app with RSpec, backed by PostgreSQL 16, with the schema kept as SQL in
`db/structure.sql`. It has one table (`notes`) so tickets can change the
database and specs can run against it. Safe to freely clone/edit/push
against — not a real project.

## Running in Docker

```bash
docker compose up -d --wait                  # Postgres 16 + the app container
docker compose exec app bin/rails db:prepare # create and load db/structure.sql
docker compose exec app bundle exec rspec
```

Migrations: `docker compose exec app bin/rails db:migrate` regenerates
`db/structure.sql`; commit it with the migration. The app image installs
`postgresql-client-16`, since `pg_dump` must match the server's major version.

## Running on the host

Needs Ruby (see `.ruby-version`) and a Postgres server. Connection settings
come from `DATABASE_HOST`, `DATABASE_PORT`, `DATABASE_USERNAME` and
`DATABASE_PASSWORD` (defaults: `localhost`, `5432`, `postgres`, `postgres`).

```bash
bundle install
bin/rails db:prepare
bundle exec rspec
```
