#!/bin/bash

set -e # This tells bash that it should exit the script if any statement returns a non-true return value.
set -x # Traces of each command plus its arguments are printed to standard output after the commands have been expanded but before they are executed.

function clean_up {
  rm -rf tmp.*

  echo cleaned
  exit
}
trap clean_up SIGINT SIGTERM

        # SIGINT: 2, interrupt process, [ctrl] + [c]
        # SIGTERM: 15, terminate process

function echo_this_dir_abs_path {
  pushd `dirname $0` > /dev/null
  local SCRIPTPATH=`pwd -P` # Display the physical current working directory
  popd > /dev/null

  echo $SCRIPTPATH
}

function mk_tmp_file {
  mktemp tmp.XXXX
}
mk_tmp_file

function mk_tmp_dir {
  mktemp -d tmp.XXXX
}
mk_tmp_dir

function set_xy {
  printf -v $1 "Hello"
  printf -v $2 "world"
}
set_xy x y
echo $x $y

function infinite_loop {
  while true; do
    $1
  done
}

function dummy {
  date
  sleep 1
}

infinite_loop dummy
