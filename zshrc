# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR="vim"
# else
#   export EDITOR="mvim"
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Activates CTRL+SHIFT+n in gnome terminal.
source /etc/profile.d/vte.sh

# My aliases.
alias rm="rm -i"
alias vi="nvim"
alias vim="nvim"
alias explore="nautilus --no-desktop . & disown"
alias sudo="sudo "
alias todo="vi $HOME/documents/todo.gpg"
alias gbpurge='git branch --merged | grep -Ev "(\*|master|develop|staging|gh-pages)" | xargs -n 1 git branch -d'
alias e='exa'
alias ls='echo "use \"e\""'
alias top='echo "use \"htop\""'
alias curl='echo "use \"http\""'
alias cat='echo "use \"bat\""'

export FZF_DEFAULT_COMMAND='fd --type f'
alias v='vi "$(fzf)"'

~/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh  # Fix terminal issue with displaying gruvbox colors properly.
export GPGKEY=33863E8C  # Set default GPG key.
export VISUAL="nvim"      # Make NeoVim the default editor.
export EDITOR="nvim"      # Make NeoVim the default editor. Now, "sudoedit" will open NeoVim.
export DIFFPROG="nvim -d" # Make NeoVim the default editor. Now, "pacdiff", will open NeoVim.
export ARCH=$(uname -m) # Set "ARCH" variable (either x86_64 or i686).
export PATH="$HOME/dotfiles/public/bin:$HOME/dotfiles/private/bin/:$PATH"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export GPG_TTY=$(tty)

# Start Xorg on startup.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# https://aur.archlinux.org/packages/z/
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

export NVM_DIR="/home/chafic/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# https://www.reddit.com/r/archlinux/comments/332jlc/psa_have_the_terminal_tell_you_what_to_install/
source /usr/share/doc/pkgfile/command-not-found.zsh

# Set up Heroku CLI autocomplete
HEROKU_AC_ZSH_SETUP_PATH=/home/chafic/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH
