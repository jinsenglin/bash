#!/bin/bash

# $1 is a command, e.g., "uname"
function indent() {
    local _indent="    "
    $1 2>&1 | sed "s/^/$_indent/g"
}

function dump() {
    echo Environment information

    echo
    indent "uname -a"

    echo
    indent "bash --version"

    echo
    indent "python --version"
}

dump
