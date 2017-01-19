#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- composer "$@"
fi

# if our command is a valid composer subcommand, let's invoke it through composer
# (this allows for "docker run docker ps", etc)
if composer help "$1" > /dev/null 2>&1; then
	set -- composer "$@"
fi

exec "$@"
