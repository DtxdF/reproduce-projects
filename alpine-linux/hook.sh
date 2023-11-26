#!/bin/sh

set -e

touch -- "${REPRODUCE_JAIL_NAME}/conf/config.conf"
appjail-config set -Vt "${REPRODUCE_JAIL_NAME}/conf/config.conf" osarch="${REPRODUCE_OSARCH}"
