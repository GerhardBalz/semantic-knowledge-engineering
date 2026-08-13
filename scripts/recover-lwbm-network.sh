#!/usr/bin/env bash
set -euo pipefail

out_dir="${1:-recovered/lwbm}"
mkdir -p "$out_dir/payloads" "$out_dir/headers"

observed_at="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
manifest_tsv="$out_dir/manifest.tsv"
printf 'name\toriginal_url\thttp_status\teffective_url\tcontent_type\tbytes\tsha256\tcurl_exit\n' > "$manifest_tsv"

probe() {
  local name="$1"
  local original_url="$2"
  local payload="$out_dir/payloads/$name"
  local headers="$out_dir/headers/$name.headers"
  local meta="$out_dir/$name.meta"

  set +e
  curl --location --silent --show-error \
    --connect-timeout 20 --max-time 120 \
    --dump-header "$headers" \
    --output "$payload" \
    --write-out '%{http_code}\n%{url_effective}\n%{content_type}\n' \
    "$original_url" > "$meta"
  local rc=$?
  set -e

  local status effective content_type bytes sha
  status="$(sed -n '1p' "$meta" 2>/dev/null || true)"
  effective="$(sed -n '2p' "$meta" 2>/dev/null || true)"
  content_type="$(sed -n '3p' "$meta" 2>/dev/null || true)"
  bytes=0
  sha=""

  if [[ -f "$payload" ]]; then
    bytes="$(wc -c < "$payload" | tr -d ' ')"
    if [[ "$bytes" != "0" ]]; then
      sha="$(sha256sum "$payload" | awk '{print $1}')"
    fi
  fi

  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
    "$name" "$original_url" "$status" "$effective" "$content_type" "$bytes" "$sha" "$rc" \
    >> "$manifest_tsv"
}

probe ontology 'http://swat.cse.lehigh.edu/onto/wine.owl'
probe data-4k 'http://swat.cse.lehigh.edu/data/wine-data.owl'
probe query-sparql 'http://swat.cse.lehigh.edu/projects/benchmarks/lwbm/query-spq.html'
probe query-rdql 'http://swat.cse.lehigh.edu/projects/benchmarks/lwbm/rdql.txt'
probe query-rql 'http://swat.cse.lehigh.edu/projects/benchmarks/lwbm/rql.txt'
probe result-4k 'http://swat.cse.lehigh.edu/projects/benchmarks/lwbm/tkde-4t.gif'
probe result-10k 'http://swat.cse.lehigh.edu/projects/benchmarks/lwbm/tkde-10t.gif'

python - "$manifest_tsv" "$out_dir/manifest.json" "$observed_at" <<'PY'
import csv
import json
import sys
from pathlib import Path

src, dst, observed_at = sys.argv[1:]
rows = []
with open(src, newline='', encoding='utf-8') as f:
    for row in csv.DictReader(f, delimiter='\t'):
        rows.append({
            'name': row['name'],
            'originalUrl': row['original_url'],
            'httpStatus': int(row['http_status']) if row['http_status'].isdigit() else None,
            'effectiveUrl': row['effective_url'] or None,
            'contentType': row['content_type'] or None,
            'bytes': int(row['bytes']) if row['bytes'].isdigit() else 0,
            'sha256': row['sha256'] or None,
            'curlExit': int(row['curl_exit']) if row['curl_exit'].isdigit() else None,
        })

manifest = {
    'benchmark': 'LWBM',
    'authority': 'Lehigh SWAT',
    'observedAt': observed_at,
    'probePolicy': {
        'startFromOriginalHttpUrl': True,
        'followRedirects': True,
        'rewritePayloads': False,
        'commitRecoveredThirdPartyBytes': False,
    },
    'artifacts': rows,
}
Path(dst).write_text(json.dumps(manifest, indent=2, sort_keys=True) + '\n', encoding='utf-8')
PY

cat "$out_dir/manifest.json"
