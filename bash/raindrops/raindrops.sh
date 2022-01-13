#!/usr/bin/env bash

main() {
  local result=""

  (( "$1" % 3 == 0 )) && result+="Pling"
  (( "$1" % 5 == 0 )) && result+="Plang"
  (( "$1" % 7 == 0 )) && result+="Plong"
  (( "${#result}" == 0 )) && result="$1" 

  echo "$result"
}

main "$@"
