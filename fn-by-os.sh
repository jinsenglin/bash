#!/bin/bash

function unknown() {
    echo Unknown $1
}

function mac() {
    echo Mac
}

function linux_centos() {
    echo Linux CentOS

    VERSION_ID=$(cat /etc/os-release | grep "^VERSION_ID=" | sed 's/VERSION_ID=//' | sed 's/"//g')
    echo Linux CentOS $VERSION_ID
}

function linux_ubuntu() {
    echo Linux Ubuntu

    VERSION_ID=$(cat /etc/os-release | grep "^VERSION_ID=" | sed 's/VERSION_ID=//' | sed 's/"//g')
    echo Linux Ubuntu $VERSION_ID
}

function linux() {
    echo Linux

    case $(cat /etc/os-release | grep "^ID=" | sed 's/ID=//' | sed 's/"//g') in
	    ubuntu)
		    linux_ubuntu
		    ;;
	    centos)
		    linux_centos
		    ;;
	    *)
		    unknown "linux release id"
		    ;;

    esac
}

case $(uname) in
	Linux)
		linux
		;;
	Darwin)
		mac
		;;
		
	*)
		unknown "os"
		;;
esac
