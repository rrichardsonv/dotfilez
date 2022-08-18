
sourcer() {
  # sources files that actually exist
  # shellcheck disable=SC1090
  [[ -r "$1" ]] && [[ -f "$1" ]] && source "$1"
}


export -f sourcer

sourcer ~/.profile
export JAVA_HOME=$(/usr/libexec/java_home)
. "$HOME/.cargo/env"
