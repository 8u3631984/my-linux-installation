#!/bin/bash

# -----------------------------------------------------
source scripts/commons.sh
# -----------------------------------------------------

clear

# -----------------------------------------------------
printInfo "update packages"
sudo pacman -Syu

# -----------------------------------------------------
printInfo "install required packages"
installSoftware "figlet" "gum"

# -----------------------------------------------------
printBanner "My Linux Arch Installation"

options=$(gum choose "config pacman" "install paru" "install services" "install software" "clone wallpaper" "clone dotfiles" --no-limit)

# -----------------------------------------------------
if [[ $options = *"config pacman"* ]]; then
  source scripts/configPacman/configPacman.sh
fi

# -----------------------------------------------------
if [[ $options = *"install paru"* ]]; then
  source scripts/aur/installParu.sh
fi

# -----------------------------------------------------
if [[ $options = *"install services"* ]]; then
    source scripts/services/installServices.sh
fi

# -----------------------------------------------------
if [[ $options = *"install software"* ]]; then
    source scripts/software/installSoftware.sh
fi

# -----------------------------------------------------
if [[ $options = *"clone wallpaper"* ]]; then
    source scripts/wallpaper/cloneWallpaperRepository.sh
fi

# -----------------------------------------------------
if [[ $options = *"clone dotfiles"* ]]; then
    source scripts/dotfiles/cloneDotfilesRepository.sh
fi



#if [[ $selected = *"cleanup"* ]]; then
#    source scripts/cleanup.sh
#fi
