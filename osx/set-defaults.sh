#----------------------------------------
# rrichardsonv's not so reasonable defaults
#----------------------------------------

# Put default mail app on lockdown
sudo chmod 000 /Applications/Mail.app/Contents/MacOS/Mail

# Send screenshots to folder instead of Desktop
SCREENSHOTS_FOLDER=~/screenshots
mkdir "$SCREENSHOTS_FOLDER" && defaults write com.apple.screencapture location "$SCREENSHOTS_FOLDER"

#----------------------------------------


# Sets reasonable OS X defaults
#
# From https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
#
# Run ./set-defaults and you'll be good to good

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library directory
chflags nohidden ~/Library

# Sets a really fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 0

# Sets the Finder prefs for showing a few different volumes on the Desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Run the screensaver if we're in the bottom-left hot corner
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# Setup Safari for development
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
