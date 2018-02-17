
sourcer() {
  # sources files that actually exist
  # shellcheck disable=SC1090
  [[ -r "$1" ]] && [[ -f "$1" ]] && source "$1"
}

export -f sourcer

sourcer ~/.profile

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="/Users/yuminwong/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# MySQL
MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
