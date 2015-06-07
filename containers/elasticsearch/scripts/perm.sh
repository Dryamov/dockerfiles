#!/usr/bin/bash

set -o errexit -o noclobber -o noglob -o nounset -o pipefail

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CNAME="${1}"

source "${SCRIPTDIR}/var.sh"
source "${SCRIPTDIR}/../../scripts/permissions.sh"

perm_user_ro "${CONFIGPATH}"
perm_user_rw "${DATAPATH}"
perm_user_rw "${LOGPATH}"
perm_user_rw "${TMPPATH}"
perm_user_rw "${WORKPATH}"
