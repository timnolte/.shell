#!/usr/bin/env bash

function setup() {
	HOME_LOCAL="$HOME/.local"
  HOME_BIN="$HOME_LOCAL/bin"

  # Make home local directory if it doesn't exist
  if [ ! -d "$HOME_LOCAL" ]; then
    mkdir -p $HOME_LOCAL
  fi
  
  
  # Make local bin directory if it doesn't exist
  if [ ! -d "$HOME_BIN" ]; then
    mkdir -p $HOME_BIN
  fi



  # Install local composer
	if [ ! -f "$HOME_BIN/composer" ]; then
		echo 'installing latest composer'

		EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
    echo 'downloading composer installer'
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_SIGNATURE="$(php -r "echo hash_file('SHA384', 'composer-setup.php');")"

    if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
    then
      echo 'ERROR: Invalid installer signature'
      rm composer-setup.php
    else
      echo 'running composer setup'
      php composer-setup.php --install-dir=$HOME_BIN --filename=composer --quiet
      rm composer-setup.php
    fi

    echo 'composer installed'
	fi


	# Install WP-CLI
	if [ ! -f "$HOME_BIN/wp" ]; then
		echo 'installing latest wp-cli'

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    echo 'verifying wp-cli download'
    php wp-cli.phar --info
    chmod +x wp-cli.phar
    mv wp-cli.phar $HOME_BIN/wp
		echo 'wp-cli installed'
	fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    setup;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setup;
    fi;
fi;
unset setup;
