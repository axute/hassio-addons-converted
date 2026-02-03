#!/usr/bin/env bash
set -e

# ENV aus options.json exportieren
if [ -f /data/options.json ]; then
    for key in $(jq -r 'keys[]' /data/options.json); do
        value=$(jq -r --arg k "$key" '.[$k]' /data/options.json)
        export "$key=$value"
        echo "export $key=$value"
    done
fi

# Originalwerte laden
orig_entrypoint=$(cat /run/original_entrypoint 2>/dev/null || echo "")
orig_cmd=$(cat /run/original_cmd 2>/dev/null || echo "")

# Wenn HA ein CMD gesetzt hat, wird es als Argument übergeben
if [ "$#" -gt 0 ]; then
    exec "$@"
fi

# Wenn das Image ein ENTRYPOINT hatte
if [ -n "$orig_entrypoint" ] && [ "$orig_entrypoint" != "null" ]; then
    exec $orig_entrypoint $orig_cmd
fi

# Wenn nur CMD existiert
exec $orig_cmd
