#!/usr/bin/env bash

st_test='/e/import/pomsstorage/miranda/tt888'
st_test_888='/e/import/pomsstorage/miranda/tt/888/'
st_test_889='/e/import/pomsstorage/miranda/tt/889/'
st_dev='/e/ap/mediabackend-dev.poms.omroep.nl/data/input/subtitles/notify'
st_dev_888='/e/ap/mediabackend-dev.poms.omroep.nl/data/input/subtitles/tt/888'
st_dev_889='/e/ap/mediabackend-dev.poms.omroep.nl/data/input/subtitles/tt/889'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

timestamp_file=$DIR/subtitles.timestamp
timestamp_file_tmp=$DIR/subtitles.timestamp_tmp

#NFS SUCKS
before=$(date --date '-5 min')

touch -m -d "$before" $timestamp_file_tmp

echo $before

find $st_test_888 -type f -newer $timestamp_file -exec cp -v  {} $st_dev_888  \;
find $st_test_889 -type f -newer $timestamp_file  -exec cp -v  {} $st_dev_889  \;
find $st_test/.camel/ -type f -newer $timestamp_file  ! -newer $timestamp_file_tmp  -exec cp -v  {} $st_dev  \;


touch -m -d "$before" $timestamp_file
