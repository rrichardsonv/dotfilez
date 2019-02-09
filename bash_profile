#!/bin/bash
# combo of:
#  - 4U6U57/dotfiles project
#  - brousalis/dotfiles

sourcer() {
  # sources files that actually exist
  # shellcheck disable=SC1090
  if [[ -r "$1" ]] && [[ -f "$1" ]]; then source "$1"; fi
}

export -f sourcer

verbose_sourcer() {
  if [[ -r "$1" ]] && [[ -f "$1" ]]; then
    source "$1"
  else
    echo "¯\_(ツ)_/¯"
  fi
}

export -f verbose_sourcer

# load files
for file in ~/.dotfilez/bash/{bash_prompt,exports,functions,aliases}; do
  verbose_sourcer "$file"
done

unset file

sourcer ~/.dotfilez/personal

verbose_sourcer ~/.bashrc

# fix font smoothing on macs
if [[ $platform = 'darwin' ]]; then
  defaults -currentHost write -g AppleFontSmoothing -int 2
fi

#rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#nodenv
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

