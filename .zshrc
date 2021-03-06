# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="wedisagree"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git-prompt zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias git=hub
alias groot='cd $(git rev-parse --show-toplevel || echo ".")'
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dmerged='git branch -d $(git branch --merged | grep -v "^*" | tr -d "\n")'
alias jrnl='ntbk'
alias tmux="env TERM=xterm-256color tmux"
alias pupper="open https://i.imgur.com/QmdNztE.gifv"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

source ~/.lastpass_shortcuts.sh

# Turn on vi mode.
bindkey -v
bindkey 'jk' vi-cmd-mode

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="/usr/local/Cellar:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$PATH:/Applications/MAMP/Library/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/bin"
export EDITOR="vim"

function jira() {
  JIRA_URL="https://jira.meredith.com/browse/$1";
  open -a /Applications/Firefox.app $JIRA_URL;
  JIRA_URL=null;
}

# Bind C-h to home dir.
function goto_home() {
  BUFFER="cd ~/"$BUFFER
  zle end-of-line
  zle accept-line
}
zle -N goto_home
# bindkey "^h" goto_home

# Turn on key bindings for zsh-autosuggestions.
bindkey '^l' autosuggest-accept
bindkey '^j' autosuggest-execute

# Disable zsh-autosuggestions for larger buffers.
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Password store options.
export PASSWORD_STORE_CLIP_TIME=10
export PASSWORD_STORE_GENERATED_LENGTH=35
export PASSWORD_STORE_CLIP_DEFAULT=1

# Synergy wrapper.
export SYNERGY_SERVER="starbuck.local"
source ~/.synscript
