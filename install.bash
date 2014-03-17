#!/bin/bash

files="bashrc vimrc vim tmux.conf"

# clean and backup

if [ -d "$HOME/dotfiles_backup" ]; then
    echo "Backup directory already generated."
else
    mkdir ~/dotfiles_backup
    for file in $files; do
        # move file or directory to backup directory only if it exists
        if [ -f "$HOME/.$file" ] || [ -d "$HOME/.$file" ]; then
            mv ~/.$file ~/dotfiles_backup/$file
        fi

        echo "Creating symlink to $HOME/Projects/dotfiles/$file...done!"
        # create symlink
        ln -s ~/Projects/dotfiles/$file ~/.$file
    done
fi
