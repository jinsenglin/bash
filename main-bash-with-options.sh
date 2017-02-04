#!/bin/bash

# r config
# r help
function dump_options() {
    local _format="%-10s = %s\n"

    printf "$_format" config $config
    printf "$_format" help $help
}

function next_step() {
    dump_options
}

function show_help() {
    local _format1="%4s, %-20s%s\n"
    local _format2="  %-24s%s\n"
    local _format3="  %s\n"

    echo Usage: $0 [OPTIONS]
    echo
    echo One line description
    echo
    echo Options:
    echo
    printf "$_format1" "-c" "--config=./" "Location of client config files"
    printf "$_format1" "-h" "--help" "Print usage"
    echo
    echo Environment Variables:
    echo
    printf "$_format2" "x_config" "Location of client config files"
    echo
    echo Examples:
    echo
    printf "$_format3" "$0"
    printf "$_format3" "$0 -h"
    printf "$_format3" "$0 --help"
    printf "$_format3" "$0 -c /tmp"
    printf "$_format3" "$0 --config /tmp"
}

# w config
# w help
function parse_options() {
    # set  default
    help=

    set -e
    while [[ $# -gt 0 ]]
    do
        key=$1

        case $key in
            -c|--config)
                config=$2
                shift # past argument
                ;;
            -h|--help)
                help=1
                ;;
            *)
                # unknown option
                echo unknown option: $key
                exit 1
                ;;
        esac

        shift # past argument
    done
    set +e
}

# w config
function parse_envvars() {
    # set default
    config=${x_config:-./}
}

# r help
function main() {
    parse_envvars
    parse_options $@
    if [ $help ]; then
        show_help
    else
        next_step
    fi
}

main $@
