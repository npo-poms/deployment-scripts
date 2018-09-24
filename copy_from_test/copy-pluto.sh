#!/usr/bin/env bash

p_test='/e/import/pomsstorage/pluto'
p_dev='/e/ap/mediabackend-dev.poms.omroep.nl/data/input/pluto'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

timestamp_file=$DIR/pluto.timestamp

before=$(date)
echo $before

find $p_test/restriction  $p_test/notify   $p_test/revoke -regex '.*/.camel/.*'   -type f -newer $timestamp_file  -exec cp -v  {} $p_dev  \;

touch -m -d "$before" $timestamp_file
