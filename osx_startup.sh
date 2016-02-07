#!/bin/sh

set -e
set -u

startup(){
  recipe=$HOME/startup-itamae

  has(){
    type "$1" > /dev/null 2>&1
  }

  # Install Itamae
  if ! has itamae; then
    sudo gem install itamae
  else
    echo 'itamae is already exists'
  fi

  # Download Itamae recipe
  if [ -d "$recipe" ]; then
    (cd "$recipe" && git pull --rebase)
  else
    git clone https://github.com/munisystem/startup-itamae "$recipe"
  fi

  # Exec Itamae
  (cd "$recipe/roles/osx" && itamae local default.rb -l debug)
}

startup
