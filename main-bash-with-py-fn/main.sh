#!/bin/bash

# $1 is a command, e.g., "uname"
function indent() {
    local _indent="    "
    $1 2>&1 | sed "s/^/$_indent/g"
}

# dependency check 
function check() {
    set -e

    echo "bash command version:"
    indent "bash --version"

    echo "python command version:"
    indent "python --version"

    echo "python command version:"
    indent "pip --version"

    echo "fab command version:"
    indent "fab --version"

    echo "pyyaml package version:"
    indent "pip show pyyaml"

    set +e
}

function example1() {
    echo "example 1 output: "
    indent "fab hello"
}

function example2() {
    echo "example 2 output: "
    indent "fab dump_yaml"
}

function example3() {
    echo "example 3 output: "
    local _value=$(fab get_version | sed '$d' | sed '$d')
    indent "echo $_value"
}

# main
check
example1
example2
example3
