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
# something
verbose_sourcer ~/.bashrc

# fix font smoothing on macs
if [[ $platform = 'darwin' ]]; then
  defaults -currentHost write -g AppleFontSmoothing -int 2
fi

# asdf version management
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
export PATH=~/.local/bin:$PATH
