#!/bin/bash

set -e

function die { ( >&2 echo "$*"); exit 1; }

# CHECK if XCODE is installed
hash xcodebuild 2>/dev/null || die "Can't find Xcode, please install from the App Store"

sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

./setup/basic-setup.sh
