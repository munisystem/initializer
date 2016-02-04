#!/bin/sh

set -e
set -u

startup(){
  recipe=$HOME/itamae-startup

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
    git clone git@github.com:munisystem/itamae-osx "$recipe"
  fi

  # Exec Itamae
  (cd "$recipe/roles/" && itamae local main.rb)
}

startup
