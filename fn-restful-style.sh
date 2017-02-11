#!/bin/bash
# try run `echo '{version: 1.0}' | $0 2> api.log | cat`

exec 3>&1
exec 1>&2

payload=$(mktemp /tmp/payload.XXXXXX)

# in
cat > $payload <&0

echo INFO: payload file $payload
echo WARN: bra bra bra

# out
echo '{status: 200}' >&3
