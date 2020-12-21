#!/bin/bash

echo -n "{\"a07e70cb-898b-4ada-9506-91e062e6641c\":{"
while (( "$#" >= 1 )); do
  if [[ $1 == \-* ]] ;
  then
    KEY=$1
    if [[ $2 == \-* ]] ;
    then
      VAL=''
      shift
    else
      VAL=$2
      shift 2
    fi
    echo -n \"${KEY}\"\: \"${VAL}\"
    (( "$#" > 0 )) && echo -n ","
  else
    shift
  fi
done
echo "}}"
