#!/bin/sh

# Set zsh
chsh -s /bin/zsh

# Install xcode
xcode-select --install

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# create dotfiles link
./link.sh

