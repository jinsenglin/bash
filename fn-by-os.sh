#!/bin/bash

function unknown() {
    echo Unknown $1
}

function mac() {
    echo Mac
}

function linux_centos() {
    echo Linux CentOS
}

function linux_ubuntu() {
    echo Linux Ubuntu
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
