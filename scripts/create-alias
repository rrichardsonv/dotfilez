#!/bin/bash

if [[ -f "$1" ]]; then
  type="file"
else
  if [[ -d "$1" ]]; then 
    type="folder"
  else
    echo "Invalid path or unsupported type"
    exit 1
  fi
fi

osascript <<END_SCRIPT
tell application "Finder"
   make new alias to $type (posix file "$1") at desktop
end tell
END_SCRIPT