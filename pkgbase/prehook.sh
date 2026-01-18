#!/bin/sh

set -x

for tag in 15 16; do
    # This is only valid if this file is deleted, so we use TMPDIR assuming that
    # this directory will eventually be deleted.
    # Otherwise, we'll have an outdated release.
    done_file="${TMPDIR:-/tmp}/.reproduce-pkgbase-${tag}.done"

    if [ -f "${done_file}" ]; then
        continue
    fi

    appjail fetch destroy -v ${tag} ${tag}-minimal > /dev/null 2>&1
    appjail fetch pkgbase -v ${tag} -r ${tag}-minimal FreeBSD-set-base-jail || exit $?

    appjail fetch destroy -v ${tag} ${tag}-full > /dev/null 2>&1
    appjail fetch pkgbase -v ${tag} -r ${tag}-full FreeBSD-set-base FreeBSD-kernel-generic || exit $?

    touch -- "${done_file}" || exit $?
done
