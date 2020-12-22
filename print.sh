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

    # Save API URL if any
    if [[ $KEY == '-APIURL' ]]
    then
      APIURL=$VAL
    else
      echo -n \"${KEY}\"\: \"${VAL}\"
    fi
    
    (( "$#" > 0 )) && echo -n ","
  else
    shift
  fi
done
echo "}}"

# Test if the API URL works (gets {"status":"OK"} if it is good)
if [[ -n ${APIURL} ]]
then
  [[ "${APIURL}" != */ ]] && APIURL="${APIURL}/"
  echo ${APIURL}
  curl --fail --silent ${APIURL}jarvice/live | tr -d " \n"
  echo
fi

