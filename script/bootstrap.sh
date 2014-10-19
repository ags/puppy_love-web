#!/usr/bin/env bash
set -e
set -x

# Gems
bundle install

# DB Setup
createuser puppy_love
createdb --owner=puppy_love puppy_love
createdb --owner=puppy_love puppy_love_test
