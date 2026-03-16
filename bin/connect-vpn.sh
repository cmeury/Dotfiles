#!/bin/bash

set -o errexit -o nounset -o pipefail

ACCOUNT="ergon.1password.eu"
ENTRY="op://Employee/Ergon AD Secure Login and GlobalProtect VPN"

eval "$(op signin --account="${ACCOUNT}")"

printf "{{ ${ENTRY}/password }}\n{{ ${ENTRY}/one-time password?attribute=otp }}" \
  | op --account="${ACCOUNT}" inject \
  | sudo openconnect --passwd-on-stdin --protocol=gp \
    --user="$(op --account="${ACCOUNT}" read "${ENTRY}/username")" \
    https://remote.ergon.ch:30001

# When connection problems to internal service occur, try adding --mtu=1300 to the openconnect call, but only if your ISP is using some kind of doubled tunnel


