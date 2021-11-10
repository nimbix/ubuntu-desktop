#!/bin/bash
echo $*

while getopts ":s:c:t:d:x:" o; do
    case "${o}" in
        s)
            SERVER=${OPTARG}
            ;;
        c)
            CORES=${OPTARG}
            ;;
        t)
            TOKEN=${OPTARG}
            ;;
        d)
            DELAY=${OPTARG}
            ;;
        x)
            EXIT=${OPTARG}
            ;;
        *)
            echo Invalid args
            ;;
    esac
done
shift $((OPTIND-1))

echo
echo "SERVER = ${SERVER}"
echo "CORES = ${CORES}"
echo "TOKEN = ${TOKEN}"
echo "DELAY = ${DELAY}"
echo "EXIT = ${EXIT}"


URL="http://${SERVER}/checkout?token=${TOKEN}&id=${JOB_NAME}&count=${CORES}"
echo Request URL is ${URL}
echo

while true
do
  echo -e -n $(date "+%T") "Reserving ${CORES} ${TOKEN} \t\t\t"
  curl -k --silent $URL | grep 'Insufficient instances of token'
  [[ "$?" != "0" ]] && [[ -n "$EXIT" ]] && exit -1
  sleep ${DELAY}
done

