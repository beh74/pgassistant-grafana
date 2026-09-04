# pgAssistant Grafana dashboards

This project provisions Grafana dashboards for the pgAssistant Collector repository (https://github.com/beh74/pgassistant-collector).

## Online DEMO

- URL : https://ov-004f8b.infomaniak.ch/grafana/
- User : admin
- Password : pgassistant


## Dashboards

The provisioned dashboards are based on the normalized Executive Plan generated
by the current pgAssistant Collector.

### Executive Plan - Fleet Overview

Provides a fleet-level summary of databases, current tasks, high-priority work,
maintenance requirements, restarts, and collection errors. It also highlights
the databases requiring the most attention and shows the task backlog over time.

### Executive Plan - Tasks & Phases

Displays the ordered implementation plan produced by pgAssistant. Tasks can be
reviewed by phase, team, priority, workstream, score, maintenance requirement,
and restart requirement.

### Executive Plan - Recommendations

Consolidates recommendations from the Global, Index, Parameter, and Autovacuum
advisors. It provides priority, impact, confidence, effort, risk, affected scope,
and generated SQL information.

### Recommendation Lifecycle

Uses stable finding fingerprints to follow recommendations across snapshots.
Findings are classified as `NEW`, `RESOLVED`, or `PERSISTING`. The dashboard also
shows recurring findings and up to 100 targets affected by a selected finding.

### Query Workload

Shows the ranked SQL workload, including priority score, calls, execution time,
cache efficiency, I/O, WAL generation, and query text. When a Team is selected,
queries are correlated with Executive Plan recommendations through `query_ids`.

### Collection Runs

Shows every collector run and its status by target. It includes success-rate
indicators, run history, failures by target, response times, and a diagnostic
table combining:

- run-level errors from `pga_collection_run`;
- job-level errors from `pga_collection_job_result`;
- advisor errors from partial Executive Plans.

### Dashboard filters

The `Team` filter follows Executive Plan ownership:

- `DEV`
- `OPS`
- `DEV_OPS`

Depending on the dashboard, it can be combined with filters for environment,
target group, target, priority, source, phase, workstream, run status, and job
type. All dashboards also follow the selected Grafana time range.

## Start

```bash
docker compose up -d
```

Open Grafana:

```text
http://localhost:3800
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

## Executive Plan repository

The current dashboards require the new collector schema based on:

- `pga_executive_plan_snapshot`
- `pga_executive_plan_phase_snapshot`
- `pga_executive_plan_task_snapshot`
- `pga_executive_plan_recommendation_snapshot`
- `pga_ranked_query_snapshot`

The former `pga_global_advisor_snapshot` dashboards are no longer provisioned.
