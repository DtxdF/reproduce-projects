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
        -e "s/%%ETCD1%%/${ETCD1}/g" \
        -e "s/%%ETCD2%%/${ETCD2}/g" \
        -e "s/%%ETCD3%%/${ETCD3}/g" \
        -e "s/%%ETCD4%%/${ETCD4}/g" > "${BASEDIR}/../reproduce.conf"
