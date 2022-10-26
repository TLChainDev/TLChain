#!/bin/bash
set -u
set -e

toml=./nodes/validator/node.toml
log=./nodes/validator/parity.log

cmd2=$(./openethereum --config $toml > $log 2>&1 &)

exit 0