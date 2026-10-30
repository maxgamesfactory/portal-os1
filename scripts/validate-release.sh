#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

check_json_route() {
  local url="$1"
  local headers_file
  headers_file="$(mktemp)"
  curl -fsS -D "$headers_file" -o /tmp/route_body.json "$url" >/dev/null
  grep -q "200" "$headers_file"
  grep -qi "application/json" "$headers_file"
}

check_registry_contract() {
  local url="$1"
  local body
  body="$(curl -fsS "$url")"
  printf '%s' "$body" | jq -e '.records == []' >/dev/null
}

npm ci
npm run typecheck
npm run build
npx wrangler deploy --dry-run --config wrangler.toml
npx wrangler deploy --dry-run --config wrangler.marketplace.toml

npx wrangler dev --local --port 8787 >/tmp/portal-worker.log 2>&1 &
WORKER_PID=$!
trap 'kill "$WORKER_PID" 2>/dev/null || true' EXIT
sleep 15

for url in \
  "http://127.0.0.1:8787/api/bemax/summary" \
  "http://127.0.0.1:8787/api/bemax/risks" \
  "http://127.0.0.1:8787/api/bemax/opportunities" \
  "http://127.0.0.1:8787/api/providers/health" \
  "http://127.0.0.1:8787/api/providers/models" \
  "http://127.0.0.1:8787/api/governor/summary" \
  "http://127.0.0.1:8787/api/governor/approvals" \
  "http://127.0.0.1:8787/api/governor/risks" \
  "http://127.0.0.1:8787/api/uss/overview" \
  "http://127.0.0.1:8787/api/uss/records"
do
  echo "Validating $url"
  check_json_route "$url"
done

for url in \
  "http://127.0.0.1:8787/api/identity/registry" \
  "http://127.0.0.1:8787/api/event/registry" \
  "http://127.0.0.1:8787/api/relationship/registry" \
  "http://127.0.0.1:8787/api/research/registry" \
  "http://127.0.0.1:8787/api/policy/registry" \
  "http://127.0.0.1:8787/api/provider/registry" \
  "http://127.0.0.1:8787/api/simulation/registry"
do
  echo "Validating registry contract $url"
  check_registry_contract "$url"
done

npm run dev:pages >/tmp/portal-pages.log 2>&1 &
PAGES_PID=$!
trap 'kill "$WORKER_PID" "$PAGES_PID" 2>/dev/null || true' EXIT
sleep 20

for path in \
  /portal/dashboard \
  /portal/bemax \
  /portal/institute \
  /portal/governor \
  /portal/ecosystem
 do
  echo "Checking pages route $path"
  curl -fsS -I "http://127.0.0.1:5173$path" | grep -q "200"
done

echo "Portal-OS1 RC validation passed."
