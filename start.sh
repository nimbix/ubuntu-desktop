#!/bin/bash
echo $*

while getopts ":s:c:t:" o; do
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
        *)
            echo Invalid args
            ;;
    esac
done
shift $((OPTIND-1))

echo "SERVER = ${SERVER}"
echo "CORES = ${CORES}"
echo "TOKEN = ${TOKEN}"
echo

while true
do
  echo Reserving ${CORES} ${TOKEN} on ${SERVER}
  URL="http://${SERVER}/checkout?token=${TOKEN}&id=${JOB_NAME}&count=${CORES}"
  echo $URL
  curl --silent $URL
  echo
  sleep 5
done

