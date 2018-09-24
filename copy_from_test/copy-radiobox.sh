#!/usr/bin/env bash



rb_test='/e/import/abexport/export/radiobox/poms-test.omroep.nl/'
rb_dev='/e/import/abexport/pomsdev/radiobox'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

timestamp_file=$DIR/radiobox.timestamp

before=$(date)
echo $before

find $rb_test/.camel/ -type f -newer $timestamp_file  -exec cp -v  {} $rb_dev  \;

touch -m -d "$before" $timestamp_file
