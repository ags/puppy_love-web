#!/usr/bin/env bash
set -e
set -x

# Gems
bundle install

# DB Setup
createuser -S -d puppy_love
createdb --owner=puppy_love puppy_love
createdb --owner=puppy_love puppy_love_test

# Print warning if Foreman is not installed.
if ! command -v foreman &>/dev/null; then
  echo "foreman is not installed."
  echo "See https://github.com/ddollar/foreman for install instructions."
fi
