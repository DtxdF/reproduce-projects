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
        -e "s/%%GO1%%/${GO1}/g" \
        -e "s/%%GO2%%/${GO2}/g" \
        -e "s/%%GO3%%/${GO3}/g" \
        -e "s/%%GO4%%/${GO4}/g" > "${BASEDIR}/../reproduce.conf"
