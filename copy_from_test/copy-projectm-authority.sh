#!/usr/bin/env bash

m_test='/e/import/pomsstorage/miranda'
m_dev='/e/ap/mediabackend-dev.poms.omroep.nl/data/input/projectm'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

timestamp_file=$DIR/projectm-authority.timestamp

before=$(date)
echo $before

find $m_test/restriction  $m_test/notify   $m_test/revoke -regex '.*/.camel/.*'   -type f -newer $timestamp_file  -exec cp -v  {} $m_dev  \;

touch -m -d "$before" $timestamp_file
