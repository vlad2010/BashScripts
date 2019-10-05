#!/bin/bash 

#simple example how to parse command line arguments in bash 

WORK_TYPE=0
UUID=""
APPLEUSER=""
FILE=""
PASSWD=""

function print_variables
{
    echo "UUID: ${UUID}"
    echo "WORK_TYPE: ${WORK_TYPE}"
    echo "PASSWD: ${PASSWD}"
    echo "BUNDLEID: ${BUNDLEID}"
    echo "FILE: ${FILE}"
    echo "APPLEUSER: ${APPLEUSER}"
}

function print_help
{
    echo "Usage: $0 some help information"
}

#
#  M A I N 
#

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -c|--check)
    shift
    WORK_TYPE="1"
    ;;
    -i|--uuid)
    UUID="$2"        # for checking notarization status 
    shift # past argument  
    shift # past value
    ;;
    -f|--file)
    FILE="$2"
    shift # past argument
    shift # past value
    ;;
    -h|--help)
    print_help
    exit 0
    ;;
    -p|--password)
    PASSWD="$2"
    shift # past argument
    shift # past value
    ;;
    -u|--user)
    APPLEUSER="$2"
    shift # past argument
    shift # past value
    ;;
    -b|--bundle-id)
    BUNDLEID="$2"
    shift # past argument
    shift # past value
    ;;
    # --default)
    # DEFAULT=YES
    # shift # past argument
    # ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters



print_variables 


