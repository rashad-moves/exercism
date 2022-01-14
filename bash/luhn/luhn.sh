#!/usr/bin/env bash

main() {
  local number="${1//[[:space:]]/}"

  fail_if_preconditions_not_met "${number}"

  is_this_a_valid_luhn_number "${number}"
}

is_this_a_valid_luhn_number() {
  local result="false"
  local total=0
  local number_to_add=0
  
  for (( i=0; i < "${#1}"; i++)); do
    number_to_add="${1:$i:1}"
    if (( ("${#number}" - i) % 2 == 0 )); then
      (( number_to_add*=2 ))
      if (( number_to_add >= 10 )); then
        (( number_to_add-=9 ))
      fi
    fi
    (( total+="${number_to_add}" ))
  done

  (( total % 10 == 0 )) && result="true"

  echo "${result}"
}

fail_if_preconditions_not_met() {
  fail_if_less_than_two_digits "$1"
  fail_if_non_numeric_chars "$1"
}

fail_if_non_numeric_chars() {
  local without_numbers="${1//[[:digit:]]/}"
  (( "${#without_numbers}" > 0 )) && fail
}

fail_if_less_than_two_digits() {
  (( ${#1} < 2 )) && fail 
}

fail() {
  echo "false"
  exit 0
}

main "$1"
