#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

rsync -av \
  "$HOME/Library/Preferences/Cubase 12/Key Commands.xml" \
  "./Library/Preferences/Cubase 12/"

rsync -av --delete \
  "$HOME/Library/Application Support/Steinberg/Track Presets/" \
  "./Library/Application Support/Steinberg/Track Presets/"

