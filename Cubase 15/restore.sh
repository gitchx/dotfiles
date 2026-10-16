#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

rsync -av \
  "./Library/Preferences/Cubase 15/Key Commands.xml" \
  "$HOME/Library/Preferences/Cubase 15/"

rsync -av --delete \
	"./Library/Application Support/Steinberg/Track Presets/" \
	"$HOME/Library/Application Support/Steinberg/Track Presets/"