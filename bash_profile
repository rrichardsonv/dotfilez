#!/bin/bash
# combo of:
#  - 4U6U57/dotfiles project
#  - brousalis/dotfiles

# auto-jump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

sourcer() {
  # sources files that actually exist
  # shellcheck disable=SC1090
  [[ -r "$1" ]] && [[ -f "$1" ]] && source "$1"
}

export -f sourcer

# load files
for file in ~/dotfiles/bash/{bash_prompt,exports,functions,aliases}; do
  sourcer "$file"
done

unset file

sourcer ~/dotfiles/personal

sourcer ~/.bashrc

# fix font smoothing on macs
if [[ $platform = 'darwin' ]]; then
  defaults -currentHost write -g AppleFontSmoothing -int 2
fi

#rbenv
eval "$(rbenv init -)"
