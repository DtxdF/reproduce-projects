#!/bin/sh

set -e

touch -- "${REPRODUCE_JAIL_NAME}/conf/config.conf"
osversion=`appjail cmd chroot "${REPRODUCE_JAIL_NAME}" freebsd-version | grep -Eo '[0-9]+\.[0-9]+-[a-zA-Z0-9]+'`
appjail-config set -Vt "${REPRODUCE_JAIL_NAME}/conf/config.conf" osarch="${REPRODUCE_OSARCH}"
appjail-config set -Vt "${REPRODUCE_JAIL_NAME}/conf/config.conf" osversion="${osversion}"
appjail-config set -Vt "${REPRODUCE_JAIL_NAME}/conf/config.conf" jail_type="thick"
