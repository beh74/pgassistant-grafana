# pgAssistant Grafana dashboards

This project provisions Grafana dashboards for the pgAssistant Collector repository.

## Online DEMO

- URL : https://ov-004f8b.infomaniak.ch/grafana/
- User : admin
- Password : pgassistant


## Dashboards

- pgAssistant - Ranked Queries Overview
- pgAssistant - Ranked Query Detail
- pgAssistant - Global Advisor Overview
- pgAssistant - Global Advisor Finding Detail

The most important dashboard is **pgAssistant - Global Advisor Overview**. It is designed as a fleet-level action board: it ranks databases to fix first based on Global Advisor findings.

## Start

```bash
cp .env.example .env
# edit .env if needed
docker compose up -d
```

Open Grafana:

```text
http://localhost:3000
```

Default login:

```text
admin / admin
```

## PostgreSQL datasource

The datasource is provisioned from `.env`:

```env
PGHOST=collector-repository
PGPORT=5432
PGDATABASE=pga_collector
PGUSER=pga_collector
PGPASSWORD=pga_collector
```

## Why the Global Advisor Overview changed

The overview is not primarily a per-database detail screen. Its first job is to answer:

> Which databases should be corrected first?

The main table, **Top databases to fix**, computes a DB attention score from:

- high-priority findings
- high-risk findings
- manual-only actions
- lock requirements
- maintenance-window requirements
- max advisor rank

This makes the dashboard useful for multi-database operations.
