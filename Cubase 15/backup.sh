#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

rsync -av \
  "$HOME/Library/Preferences/Cubase 15/Key Commands.xml" \
  "./Library/Preferences/Cubase 15/"
