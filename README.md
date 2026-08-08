# pgAssistant Grafana dashboards

This project provisions Grafana dashboards for the pgAssistant Collector repository (https://github.com/beh74/pgassistant-collector).

## Online DEMO

- URL : https://ov-004f8b.infomaniak.ch/grafana/
- User : admin
- Password : pgassistant


## Dashboards

- pgAssistant - Fleet Evolution Overview
- pgAssistant - Ranked Queries Overview
- pgAssistant - Ranked Query Detail
- pgAssistant - Global Advisor Overview
- pgAssistant - Global Advisor Finding Detail
- pgAssistant - Recommendations Evolution

## Start

```bash
docker compose up -d
```

Open Grafana:

```text
http://localhost:3000
```

Default login:

```text
admin / pgassistant
```

## PostgreSQL datasource

The datasource is provisioned from `docker-compose.yml`:

```env
PGHOST=collector-repository
PGPORT=5432
PGDATABASE=pga_collector
PGUSER=pga_collector
PGPASSWORD=pga_collector
```

## Why the Global Advisor Overview changed

The overview is not primarily a per-database detail screen. Its first job is to answer:

> Which databases should be corrected first and how to apply corrections ?

The main table, **Top databases to fix**, computes a DB attention score from:

- high-priority findings
- high-risk findings
- manual-only actions
- lock requirements
- maintenance-window requirements
- max advisor rank

This makes the dashboard useful for multi-database operations.
