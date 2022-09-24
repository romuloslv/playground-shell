#!/bin/ash

IMGS1="\n    ( ( \n     ) ) \n .......... \n |        |]\n \        / \n  -------- \n\n"
IMGS2="\n     ) ) \n    ( ( \n .......... \n |        |]\n \        / \n  -------- \n\n"

tput_loop() {
    x=0
    while [ $x -lt 8 ]; do
      tput $1
      x=$(( x + 1 ))
    done
}

coffee() {
    IFS='%'
    tput civis
    while [ $(ps a | awk '{print $1}' | grep $1) ]; do
      echo -ne $IMGS1
      tput_loop "cuu1"
      sleep 0.5
      echo -ne "$IMGS2"
      tput_loop "cuu1"
      sleep 0.5
    done
    tput_loop "cud1"
    tput cvvis
}

initial() {
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
