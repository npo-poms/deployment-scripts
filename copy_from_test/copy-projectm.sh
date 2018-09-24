#!/usr/bin/env bash

m_test='/e/import/pomsstorage/miranda/voorspel'
m_dev='/e/ap/mediabackend-dev.poms.omroep.nl/data/input/projectmforecast'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

timestamp_file=$DIR/projectm.timestamp

before=$(date)
echo $before

find $m_test/internetvod/.camel  -type f -newer $timestamp_file  -exec cp -v  {} $m_dev  \;

touch -m -d "$before" $timestamp_file
