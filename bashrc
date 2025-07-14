
sourcer() {
  # sources files that actually exist
  # shellcheck disable=SC1090
  [[ -r "$1" ]] && [[ -f "$1" ]] && source "$1"
}


export -f sourcer

# sourcer ~/.profile
# export JAVA_HOME=$(/usr/libexec/java_home)
# . "$HOME/.cargo/env"
test -f /Users/rrichardson/.cars_secrets && source "/Users/rrichardson"/.cars_secrets
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(direnv hook bash)"


. "/Users/rrichardson"/.asdf/asdf.sh

. "/Users/rrichardson"/.asdf/completions/asdf.bash
