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
        -e "s/%%POSTGRES1%%/${POSTGRES1}/g" \
        -e "s/%%POSTGRES2%%/${POSTGRES2}/g" \
        -e "s/%%POSTGRES3%%/${POSTGRES3}/g" \
        -e "s/%%POSTGRES4%%/${POSTGRES4}/g" \
        -e "s/%%POSTGRES5%%/${POSTGRES5}/g" > "${BASEDIR}/../reproduce.conf"
