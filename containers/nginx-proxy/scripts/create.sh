#!/usr/bin/bash

set -o errexit -o noclobber -o noglob -o nounset -o pipefail

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CNAME="${1}"

source "${SCRIPTDIR}/var.sh"

docker create \
    --read-only \
    --volume="${CONFIGPATH}:${PRIMPATH}/config:ro" \
    --volume="${CRYPTOPATH}:${PRIMPATH}/crypto:ro" \
    --volume="${LIBPATH}:${PRIMPATH}/lib:rw" \
    --volume="${LOGPATH}:${PRIMPATH}/log:rw" \
    --cap-drop 'ALL' \
    --cap-add 'NET_BIND_SERVICE' \
    --net='none' \
    --dns="${DNSSERVER}" \
    --name="${CNAME}" \
    --hostname="${CNAME}" \
    --memory="${MEMORY}" \
    --memory-swap='-1' \
    --cpu-shares="${CPU_SHARES}" \
    nfnty/arch-nginx:latest
