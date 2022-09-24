#!/bin/sh

IMGS1="\n    ( ( \n     ) ) \n .......... \n |        |]\n \        / \n  -------- \n\n"
IMGS2="\n     ) ) \n    ( ( \n .......... \n |        |]\n \        / \n  -------- \n\n"

function tput_loop() { 
    x=0
    while [ $x -lt 8 ]; do
        tput $1
        x=$(( x + 1 ))
    done 
}

function coffee() {
    echo -e "\nAs promised, here is your coffee and your next information.\nTip: /opt/bert.rb"
    IFS='%'
    tput civis
    while [ "$(ps a | awk '{print $1}' | grep $1)" ]; do
      echo -ne $IMGS1
      tput_loop "cuu1"
      sleep 0.5
      echo -ne $IMGS2
      tput_loop "cuu1"
      sleep 0.5
    done
    tput_loop "cud1"
    tput cvvis
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
