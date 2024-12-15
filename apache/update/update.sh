#!/bin/sh

BASEDIR=`dirname -- "$0"` || exit $?
BASEDIR=`realpath -- "${BASEDIR}"` || exit $?

. "${BASEDIR}/update.conf"

set -xe
set -o pipefail

cat -- "${BASEDIR}/reproduce.conf.template" |\
    sed -E \
        -e "s/%%TAG1%%/${TAG1}/g" \
        -e "s/%%TAG2%%/${TAG2}/g" \
        -e "s/%%PHP1%%/${PHP1}/g" \
        -e "s/%%PHP2%%/${PHP2}/g" \
        -e "s/%%PHP3%%/${PHP3}/g" > "${BASEDIR}/../reproduce.conf"
