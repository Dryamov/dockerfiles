#!/usr/bin/bash

set -o errexit -o noclobber -o noglob -o nounset -o pipefail

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CNAME="${1}"

source "${SCRIPTDIR}/var.sh"

docker create \
    --read-only \
    --volume="${BASEPATH}:${PRIMPATH}/base:rw" \
    --volume="${CONFIGPATH}:${PRIMPATH}/config:ro" \
    --volume="${LUAPATH}:${PRIMPATH}/lua:ro" \
    --volume="${ULOGDPATH}:${PRIMPATH}/host/ulogd:ro" \
    --cap-drop 'ALL' \
    --net='none' \
    --dns="${DNSSERVER}" \
    --name="${CNAME}" \
    --hostname="${CNAME}" \
    --memory="${MEMORY}" \
    --memory-swap='-1' \
    --cpu-shares="${CPU_SHARES}" \
    nfnty/arch-heka:latest