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

    # Test if the API URL works (gets "OK" if it is good)
    if [[ $KEY == '-APIURL' ]]
    then
      [[ "${VAL}" != */ ]] && VAL="${VAL}/"
      echo -n "\"APIURLTEST\":\"$(curl --fail --silent ${VAL}live | tr -d ' \n{":}')\","
    fi

    echo -n \"${KEY}\"\: \"${VAL}\"
    (( "$#" > 0 )) && echo -n ","
  else
    shift
  fi
done

echo "}}"
