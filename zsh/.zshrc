HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

export PAGER=less

setopt extendedglob
unsetopt beep

zstyle :compinstall filename '/home/dan/.zshrc'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz compinit
compinit

autoload -U promptinit
promptinit
prompt redhat

# Use vim as the default editor
export EDITOR='vim'
# Use vi navigation for zsh
bindkey -v
bindkey '^R' history-incremental-search-backward

`~/bash_scripts/keyring_socket_finder.py`

function gp() { `~/bash_scripts/git_helper.py $*`; }
function up() { `~/bash_scripts/up.py $*`; }
function gra() { ack "$*"; }
function grai() { ack -i "$*"; }

# Have ssh go through the colorizer
function ssh() { ~/bash_scripts/ssh_colorizer "$*"; }

alias nl='~/bash_scripts/nested_load.py'
alias fsr='~/bash_scripts/file_search_replace.py'

# Some alias for some common git commands
alias tkgit='git difftool --tool=tkdiff --no-prompt'
alias tkc='tkgit --cached'
alias mld='git difftool --tool=meld --no-prompt'
alias gitp='git pull --rebase'

# Slow down SCP so as not to break our cable internet for everybody
alias scp='scp -l 8000'

alias cru='/mnt/ssd/clients/python/thumbtack/tools/code_review_upload.py'

function c() { `~/bash_scripts/client_mover.py $*`; }

export PATH=$PATH:~/git-configuration/bin

if [ "$ROXTERM_NUM" ]; then
    dbus-send --session /net/sf/roxterm/Options net.sf.roxterm.Options.SetColourScheme string:$ROXTERM_ID "string:Tango"
fi
