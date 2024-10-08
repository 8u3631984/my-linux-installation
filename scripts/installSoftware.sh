#!/bin/bash

pacmanPackages=(    
    "alacritty"                         # terminal emulator     
    "ansible"                           #
    "bash-completion"                   # programmable completion for the bash shell
    "bitwarden"                         # secure and free password manager
    "brasero"                           # CD/DVD mastering tool
    "btop"                              # monitor of system resources
    "code"                              # visual Studio Code
    "dmenu"                             # dynamic menu for X    
    "dunst"                             # notification-daemon
    "eza"                               # modern replacement for ls
    "feh"                               # image viewer, used to set the background image    
    "filezilla"                         # FTP, FTPS and SFTP client  
    "fzf"                               # command-line fuzzy finde
    "gimp"                              # image manipulation program
    "gradle"                            # build system for the JVM
    "intellij-idea-community-edition"   # IDE for Java, Groovy and other programming 
    "krusader"                          # file manager
    "less"                              #
    "maven"                             # java  project management and project comprehension tool
    "libreoffice-fresh"                 # office tool
    "libreoffice-fresh-de"              #
    "neovim"                            # commandline text editor
    "net-tools"                         # configuration tools for Linux networking
    "networkmanager"                    #
    "network-manager-applet"            #
    "nm-connection-editor"              # networkManager GUI 
    "picom"                             # standalone compositor for Xorg    
    "python-pip"                        # recommended tool for installing Python packages
    "python-pywal"                      # Generate and change colorschemes on the fly
    "qtile"                             # qtile display manager    
    "rpi-imager"                        # raspberry Pi Imaging Utility
    "rofi"
    "thunderbird"                       # mail and news reader
    "thunderbird-i18n-de"               #
    "ttf-jetbrains-mono-nerd"           # jetbrains font
    "ttf-hack-nerd"                     # hack font
    "unzip"                             # extracting and viewing files in .zip archives
    "virtualbox"                        #
    "virtualbox-guest-utils"            #
    "vlc"                               # multi-platform MPEG, VCD/DVD, and DivX player
    "wget"                              # network utility to retrieve files from the Web
    "wireguard-tools"                   # secure network tunnel
    "zsh"                               # command interpreter (
    "zsh-completions"                   # additional completion definitions for Zsh
)

aurPackages=(
    "brave-bin"                         # web browser
    "joplin-app-image"                  # note and to-do application
    "qtile-extras"                      # Unofficial mods for qtile
    "synology-drive"                    # synology sync
    "zulu-21-bin"                       # Zulu builds of OpenJDK 
)

printScriptHeader "software"
# -----------------------------------------------------

printInfo "which software packages should be installed?"
software=$(gum choose "pacman packages" "aur packages" --selected="pacman packages","aur packages" --no-limit)

if [[ $software = *"pacman packages"* ]]; then
    printInfo "install pacman packages"
    installPackagesWithPackman "${pacmanPackages[@]}"
fi

if [[ $software = *"aur packages"* ]]; then

    if pacman -Qs paru > /dev/null ; then
        printInfo "paru is already installed"
    else
        printInfo "install paru"
        cloneGitReposiotry "https://aur.archlinux.org/paru.git" "/tmp/paru" 

        CURRENT_DIR=$(pwd)
        cd /tmp/paru &&  makepkg -si --noconfirm
        cd $CURRENT_DIR
        rm -rf /tmp/paru
    fi

    printInfo "install aur packages"
    installPackagesWithParu "${aurPackages[@]}"
fi
