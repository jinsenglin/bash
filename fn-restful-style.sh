#!/bin/bash
# try run `echo '{"version": "1.0"}' | $0 2> api.log | cat`

exec 3>&1
exec 1>&2

payload=$(mktemp /tmp/payload.XXXXXX)

# in
cat > $payload <&0

echo INFO: payload file $payload
echo INFO: payload content:

jq -r '.' < $payload

version=$( jq -r '.version' < $payload )
echo INFO: version $version

# out
echo '{"status": 200}' >&3