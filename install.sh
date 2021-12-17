#!/bin/bash

cd "$(dirname "$0")" || exit 0
export RAILS_ENV=development

echo "########### CHECKING DEPENDENCIES ###########"

dependencies=(yarn ruby bundler rails)

for d in "${dependencies[@]}"
  do
    has_dependency=$(which "$d")
    if [[ "not found" =~ .*"$has_dependency".* ]]; then
      echo "$d is not found, please check your setup."
      exit 0
    else
      echo "$d is found."
    fi
done

echo "########### END CHECKING DEPENDENCIES ###########"

echo "########### BUNDLER INSTALL ###########"
bundler install

echo "########### WEBPACKER INSTALL ###########"
rails webpacker:install

echo "########### DB SETUP ###########"
rails db:setup
echo "########### DB SEED ###########"
rails db:seed

echo "Script ended. Please run a local server and make sure everything is correctly installed."

