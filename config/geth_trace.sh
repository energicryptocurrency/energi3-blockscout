#!/bin/sh

tracer=$(dirname $0)/../apps/ethereum_jsonrpc/priv/js/ethereum_jsonrpc/geth/debug_traceTransaction/tracer.js
tracer=$(jq -n --arg script "$(cat $tracer)" '{ tracer: $script}')
#$(sed -e 's,",\\",g' $tracer)

curl -X POST \
    -H 'Content-Type: application/json' \
    $ETHEREUM_JSONRPC_TRACE_URL \
    -d @- <<EOT | jq .
{
  "jsonrpc": "2.0",
  "method": "debug_traceTransaction",
  "params": [
    "$1",
    $tracer
  ],
  "id": 1
}
EOT
