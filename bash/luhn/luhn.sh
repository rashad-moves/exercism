#!/usr/bin/env bash

shopt -s extglob

main() {
  local result="false"
  local number="$1"
  local total=0
  
  number=$(strip_whitespace "$number")
  number=$(strip_leading_zeros "$number")
  
  check_preconditions "$number"
  
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
  (( "${#without_numbers}" < "${#1}" )) && fail
}

must_be_longer_than_single_digit() {
  (( ${#1} < 2 )) && fail 
}

fail() {
  echo "false"
  exit 0
}


main "$1"
