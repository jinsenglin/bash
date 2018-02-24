#!/bin/bash

# std out
echo 1

# std err
ls 1

# redirect output from console to file
exec 3> this.log # use fd3 to open file this.log (only write mode)
exec 9>&1 # backup fd1
exec 8>&2 # backup fd2
exec 1>&3 # redirect std out to fd3
exec 2>&3 # redirect std err to fd3

# std out
echo 2

# std err
ls 2

# redirect output from file to console
exec 3>&- # close fd3
exec 1>&9 # redirect std out to fd9
exec 2>&8 # redirect std err ot fd8

# std out
echo 3

# std err
ls 3

