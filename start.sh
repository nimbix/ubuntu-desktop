#!/bin/bash
echo $*

while getopts ":s:c:t:d:" o; do
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

URL="http://${SERVER}/checkout?token=${TOKEN}&id=${JOB_NAME}&count=${CORES}"
echo Request URL is ${URL}
echo

while true
do
  echo -e -n $(date "+%T") "Reserving ${CORES} ${TOKEN} \t\t\t"
  curl --silent $URL
  sleep ${DELAY}
done

