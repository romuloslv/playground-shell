#!/usr/bin/env bash

IMGS=(
"
     ( (    \n\
      ) )   \n\
  .......... \n\
  |         |]\n\
  \        / \n\
   --------  \n
" "
       ) )     \n\
      ( (    \n\
  .......... \n\
  |         |]\n\
  \        / \n\
   --------  \n
" )

function tput_loop() {
  x=0
  while [ $x -lt 8 ]; do
    tput $1
    x=$(( x + 1 ))
  done
}

function coffee() {
  IFS='%'
  tput civis
  while [ "$(ps a | awk '{print $1}' | grep $1)" ]
  do
    for x in "${IMGS[@]}"
    do
      echo -ne $x
      tput_loop "cuu1"
      sleep 0.5
    done
  done
  tput_loop "cud1"
  tput cvvis
}

function initial() {
  if [[ "$1" =~ ^sleep\ [0-9]+$ ]]; then
    $1 & coffee $!
  else
    echo 'Usage: ./coffee "sleep 10"'
    exit 1
  fi
}

initial "$1"
