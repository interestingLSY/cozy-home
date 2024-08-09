#!/bin/bash
set -e

if [[ -z "${HOME_ROOT}" ]]; then
  echo "HOME_ROOT is not defined!"
  exit 1
else
  HOME="${HOME_ROOT}"
fi


