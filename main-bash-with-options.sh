#!/bin/bash

function next_step() {
    echo next_step
}

function show_help() {
    echo Usage
}

# set config
# set help
function parse_options() {
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

# set help
function parse_envvars() {
    # set default
    help=${x_help:-}
}

# main
parse_envvars
parse_options $@
if [ $help ]; then
        show_help
else
        next_step
fi
