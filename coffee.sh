#!/bin/bash

IMGS=(
"
      ) )   \n\
     ( (    \n\
      ) )   \n\
  .......... \n\
  |         |]\n\
  \        / \n\
   --------  \n
" "
      ( (    \n\
       ) )     \n\
      ( (    \n\
  .......... \n\
  |         |]\n\
  \        / \n\
   --------  \n
" )

function tput_loop() {
    for((x=0; x < 8; x++))
    do
        tput $1
    done
}

function coffee() {
    local pid=$1
    IFS='%'
    tput civis # hide cursor
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]
    do
        for x in "${IMGS[@]}"
        do
            echo -ne $x
            tput_loop "cuu1" # up one line
            sleep 0.5
        done
    done
    tput_loop "cud1"
    tput cvvis # unhide cursor

}

function initial() {
  case $1 in
    "")
      echo 'Usage: ./coffee "sleep 10"'
      exit 1
      ;;
    *)
      $1 & coffee $!
      ;;
  esac
}

initial "$1"
