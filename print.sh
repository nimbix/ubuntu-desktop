#!/bin/bash

echo -n "{"
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
echo "}"
