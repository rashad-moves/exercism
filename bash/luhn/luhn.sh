#!/usr/bin/env bash

shopt -s extglob

main() {
  local result="false"
  local number="$1"
  declare -i local total=0
  declare -i local number_to_add=0
  number=$(strip_whitespace "$number")
  number=$(strip_leading_zeros "$number")
  
  check_preconditions "$number"
  
  for (( i=0; i < "${#number}"; i++)); do
    #echo "----------------"
    #echo "index $i"
    number_to_add=${number:$i:1}
    #echo "number_to_add $number_to_add"
    if (( i % 2 == 0 )); then
      number_to_add=${number_to_add}*2;
      #echo "number_to_add $number_to_add after inside mod 2"
      if (( number_to_add >= 10 )); then
         number_to_add+=-9
         #echo "number_to_add $number_to_add after inside mod 2"
      fi
    fi
    total+=number_to_add
    #echo "total after adding number_to_add $total"
  done

  (( total % 10 == 0 )) && result="true"

  echo "${result}"
}

strip_leading_zeros() {
  echo "${1##*(0)}"
}

strip_whitespace() {
  echo "${1//*( )/}"
}

check_preconditions() {
  must_be_longer_than_single_digit "$1"
  must_contain_only_numbers "$1"
}


must_contain_only_numbers() {
  local without_numbers="${1//[0-9]/}"
  (( "${#without_numbers}" > 0 )) && fail
}

must_be_longer_than_single_digit() {
  (( ${#1} < 2 )) && fail 
}

fail() {
  echo "false"
  exit 0
}


main "$1"
