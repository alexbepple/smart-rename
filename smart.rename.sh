#!/bin/bash

PRG="$0"
while [ -h "$PRG" ]; do
    PRG=`readlink "$PRG"`
done
PRG_HOME=`dirname "$PRG"`

$PRG_HOME/smart.rename.rb "$1"
