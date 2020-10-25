#!/bin/bash -eu

CMD=${@:-}
SCRIPTDIR=`dirname $0`

ssh -i ${SCRIPTDIR}/share/vm/buster.id_rsa -p 10022 root@localhost $CMD
