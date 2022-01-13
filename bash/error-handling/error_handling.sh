#!/usr/bin/env bash

check_only_one_argument() {
  if (( $# != 1 )); then
    echo "Usage: ${0} <person>" >&2
    exit 1
  fi
}
  
main() {
  check_only_one_argument "${@}"
  echo "Hello, ${1}"
}

main "${@}"
