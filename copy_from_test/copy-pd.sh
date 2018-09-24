#!/usr/bin/env bash

pd_test='/e/import/pomsstorage/pg/poms'
pd_dev='/e/import/abexport/pomsdev/pg/poms/'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

timestamp_file=$DIR/pd.timestamp

before=$(date)
echo $before

find $pd_test/.camel/ -type f -newer $timestamp_file  -exec cp -v  {} $pd_dev  \;

touch -m -d "$before" $timestamp_file
