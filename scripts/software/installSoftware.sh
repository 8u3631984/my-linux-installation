#!/bin/bash

pacmanPackages=(
  "alacritty"              # terminal emulator
  "ansible"                #
  "bash-completion"        # programmable completion for the bash shell
  "btop"                   # monitor of system resources
  "dmenu"                  # dynamic menu for X
  "dunst"                  # notification-daemon
  "eza"                    # modern replacement for ls
  "fastfetch"              # A feature-rich and performance oriented neofetch like system information tool
  "feh"                    # image viewer, used to set the background image
  "fzf"                    # command-line fuzzy finde
  "krusader"               # file manager
  "less"                   #
  "neovim"                 # commandline text editor
  "net-tools"              # configuration tools for Linux networking
  "networkmanager"         #
  "network-manager-applet" #
  "nitrogen"               # setter for x windows
  "nm-connection-editor"   # networkManager GUI
  "picom"                  # standalone compositor for Xorg
  "python-pip"             # recommended tool for installing Python packages
  "python-pywal"           # Generate and change colorschemes on the fly
  "qtile"                  # qtile display manager
  "rofi"
  "stow"
  "ttf-jetbrains-mono-nerd" # jetbrains font
  "ttf-hack-nerd"           # hack font
  "ttf-nerd-fonts-symbols"  # High number of extra glyphs from popular 'iconic fonts'
  "wget"                    # network utility to retrieve files from the Web
  "zsh"                     # command interpreter (
  "zsh-completions"         # additional completion definitions for Zsh
)

aurPackages=(
  "qtile-extras"            # Unofficial mods for qtile
  "checkupdates-with-aur"   # Helper script to check updates, including AUR updates
)

# -----------------------------------------------------
printScriptHeader "software"

installSoftware "${pacmanPackages[@]}"

if pacman -Qs paru >/dev/null; then
  installAURSoftware "${aurPackages[@]}"
fi
