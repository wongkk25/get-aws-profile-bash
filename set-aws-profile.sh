#!/bin/bash

set -e

# default to zshrc, modify as necessary depending on your shell
if [[ "$1" == "" ]]; then
  file=~/.zshrc
else
  file=$1
fi

echo "Setting AWS credential environment variables at $file"

sed -i -e '/.*AWS_ACCESS_KEY_ID.*/d' $file
sed -i -e '/.*AWS_SECRET_ACCESS_KEY.*/d' $file
sed -i -e '/.*AWS_SESSION_TOKEN.*/d' $file

./get-aws-profile.sh >> $file
