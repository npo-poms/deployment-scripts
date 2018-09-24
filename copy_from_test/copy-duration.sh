#!/usr/bin/env bash


duration_test='/e/import/pomsstorage/pluto/duration'
duration_dev='/e/ap/mediabackend-dev.poms.omroep.nl/data/input/duration'


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

timestamp_file=$DIR/duration.timestamp

before=$(date)
echo $before

find $duration_test/.camel/ -type f -newer $timestamp_file  -exec cp -v  {} $duration_dev  \;

touch -m -d "$before" $timestamp_file
