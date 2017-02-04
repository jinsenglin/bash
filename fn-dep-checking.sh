#!/bin/bash

# w z
function check_z() {
    z=Y
}

# w y
function check_y() {
    y=N
}

# w x
function check_x() {
    x=Y
}

# r z
# r y
# r x
function check() {
    local _format="    %-25s[ %s ]\n"

    echo Dependency checking ...
    check_x; printf "$_format" "x" "$x"; [ $x == N ] && exit 1
    check_y; printf "$_format" "y" "$y"; [ $y == N ] && exit 1
    check_z; printf "$_format" "z" "$z"; [ $z == N ] && exit 1
}

check
