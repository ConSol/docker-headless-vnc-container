#!/usr/bin/env bash
set -e -o pipefail

cd $2
dgoss run $1
cd -