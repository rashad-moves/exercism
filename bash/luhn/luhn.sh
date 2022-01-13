#!/usr/bin/env bash

shopt -s extglob

main() {
  local result="false"
  local number="${1//*( )/}"
  declare -i local total=0
  declare -i local number_to_add=0
  
  check_preconditions "${number}"
  
  for (( i=0; i < "${#number}"; i++)); do
    number_to_add=${number:$i:1}
    if (( ("${#number}" - i) % 2 == 0 )); then
      number_to_add="${number_to_add}"*2;
      if (( number_to_add >= 10 )); then
         number_to_add+=-9
      fi
    fi
    total+=number_to_add
  done

  (( total % 10 == 0 )) && result="true"

  echo "${result}"
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
  (( ${#1} <= 1 )) && fail 
}

fail() {
  echo "false"
  exit 0
}

main "$1"
