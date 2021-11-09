#!/bin/bash

function call()
{
  echo $*
  curl --silent "${JARVICE_LIC_SERVER}/$1?$2" | jq -c
  echo
}

function waitForExpiry()
{
  echo Waiting for token expiry
  sleep 20
  echo
}

echo Bad args checkout
call checkout "token=fooo"

echo Bad token checkout
call checkout "token=fooo&id=1&count=1"

echo Token reservation limit
call checkout "token=foo&id=1&count=100"

echo Missing count
call checkout "token=foo&id=1"

echo Valid checkout
call checkout "token=foo&id=1&count=10"

echo Bad args checkin
call checkin "token=fooo"

echo Bad token checkin
call checkin "token=fooo&id=1&count=1"

echo Bad jobid checkin
call checkin "token=foo&id=2&count=1"

waitForExpiry

echo Expired token checkin
call checkin "token=foo&id=1"

echo Check state
call state

echo Valid checkout
call checkout "token=foo&id=1&count=10"

sleep 3
echo Valid checkout refresh
call checkout "token=foo&id=1&count=10"

sleep 3
echo Valid checkout refresh
call checkout "token=foo&id=1&count=10"

echo Check state
call state

echo Check available
call available

waitForExpiry

echo Check state
call state

echo Check available
call available

