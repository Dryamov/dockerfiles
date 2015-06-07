#!/usr/bin/bash

set -o errexit -o noclobber -o noglob -o nounset -o pipefail

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CNAME='transmission' UGID='100000' PRIMPATH='/transmission'
MEMORY='4G' CPU_SHARES='512'

source "${SCRIPTDIR}/../../scripts/variables.sh"

CONFIGPATH="${HOSTPATH}/config"
TORRENTPATH='/mnt/1/share/torrent'

perm_user_rw "${CONFIGPATH}"
perm_custom "${TORRENTPATH}" "${UGID}" '140000' 'u=rwX,g=rwXs,o=' '-type d'
perm_custom "${TORRENTPATH}" "${UGID}" '140000' 'u=rwX,g=rwX,o=' '-type f'

docker create \
    --read-only \
    --volume="${CONFIGPATH}:${PRIMPATH}/config:rw" \
    --volume="${TORRENTPATH}:${PRIMPATH}/torrent:rw" \
    --cap-drop 'ALL' \
    --net='none' \
    --dns="${DNSSERVER}" \
    --name="${1:-"${CNAME}"}" \
    --hostname="${CNAME}" \
    --memory="${MEMORY}" \
    --memory-swap='-1' \
    --cpu-shares="${CPU_SHARES}" \
    nfnty/arch-transmission:latest
