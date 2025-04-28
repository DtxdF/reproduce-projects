#!/bin/sh

set -e

touch -- "${REPRODUCE_JAIL_NAME}/conf/config.conf"
appjail-config set -Vt "${REPRODUCE_JAIL_NAME}/conf/config.conf" osarch="${REPRODUCE_OSARCH}"
appjail-config set -Vt "${REPRODUCE_JAIL_NAME}/conf/config.conf" osversion="${REPRODUCE_OSVERSION}"
appjail-config set -Vt "${REPRODUCE_JAIL_NAME}/conf/config.conf" jail_type="thick"
