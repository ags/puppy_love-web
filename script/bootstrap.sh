#!/usr/bin/env bash
set -e
set -x

# Set up gem dependencies.
bundle install

# Create database user and databases.
createuser -S -d puppy_love
createdb --owner=puppy_love puppy_love
createdb --owner=puppy_love puppy_love_test

# Set up database schema.
RAILS_ENV=development bundle exec rake db:migrate
RAILS_ENV=test bundle exec rake db:migrate

# Print warning if Foreman is not installed.
if ! command -v foreman &>/dev/null; then
  echo "foreman is not installed."
  echo "See https://github.com/ddollar/foreman for install instructions."
fi
