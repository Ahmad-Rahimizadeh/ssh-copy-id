#!/bin/bash
USER_NAME="$1"
HOST_FILE="$2"
ERROR_FILE="/tmp/ssh-copy_error.txt"
PASSWORD_FILE="$3"

if [ ! -f  $PUBLIC_KEY_FILE ]; then
        echo "File '$PUBLIC_KEY_FILE' not found!"
        exit 1
fi

if [ ! -f $HOST_FILE ]; then
        echo "File '$HOST_FILE' not found!"
        exit 2
fi

for IP in `cat $HOST_FILE`; do
        sshpass -f $PASSWORD_FILE ssh-copy-id $USER_NAME@$IP 2>$ERROR_FILE
        RESULT=$?
        if [ $RESULT -eq 0 ]; then
                echo ""
                echo "Public key successfully copied to $IP"
                echo ""
        else
                echo "$(cat  $ERROR_FILE)"
                echo
                exit 3
        fi
        echo ""
done
