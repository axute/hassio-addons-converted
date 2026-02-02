#!/bin/sh

if [ -f /data/options.json ]; then
  # Einfaches Parsen der options.json (erfordert jq, falls vorhanden, sonst Fallback auf simples awk/sed)
  if command -v jq >/dev/null 2>&1; then
    eval $(jq -r 'to_entries | .[] | "export " + .key + "=\"" + (.value|tostring) + "\""' /data/options.json)
  else
    # Fallback ohne jq: sehr simples parsing für Strings
    export $(grep -o '"[^"]*"\s*:\s*"[^"]*"' /data/options.json | sed 's/"//g' | sed 's/\s*:\s*/=/')
  fi
fi

exec "$@"
