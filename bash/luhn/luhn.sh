#!/usr/bin/env bash

main() {
  local result="false"
  local number="$1"
  local total=0
  
  number=strip_leading_zeros number
  number=strip_whitespace number
  
  check_preconditions number
  
  (( total % 10 == 0 )) && result="true"

  echo "${result}"
}

strip_leading_zeros() {

}

strip_whitespace() {

}

check_preconditions() {
  must_be_longer_than_single_digit "$1"
  must_contain_only_numbers "$1"
}


must_contain_only_numbers() {
  
}

must_be_longer_than_single_digit() {
  
}

fail() {
  echo "false"
  exit 0
}

main "$1"
