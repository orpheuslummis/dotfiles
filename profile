# GNU coreutils: tweak the legibility of df, du and ls
export BLOCK_SIZE=si

IGNOREEOF=1

# Bash history
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export HISTSIZE= 
export HISTFILESIZE=
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

export EDITOR='nvim'
alias e='$EDITOR'
alias vim='nvim'

alias l='ls -lt'
alias la='ls -lat'
alias ..='cd ..'

alias rm='rm -i'

alias g='git'
alias ga='git add'
alias gc='git commit'
alias gl='git log'
alias gs='git status'
alias gd='git diff'

alias cat='batcat'

alias tm='tmux new -A'

alias r='ranger'

alias lin='linode-cli' 

alias now='date -u +"%Y-%m-%d %H:%M %a %Z"'
alias today='date +"%Y-%m-%d"'

# if these paths exist, include them
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.yarn/bin" ] ; then
    PATH="$HOME/.yarn/bin:$PATH"
fi
if [ -e /home/o/.nix-profile/etc/profile.d/nix.sh ]; then
    . /home/o/.nix-profile/etc/profile.d/nix.sh
fi

# export PATH=$PATH:/usr/local/go/bin

# mkdir -p $HOME/.pycache
# export PYTHONPYCACHEPREFIX=$HOME/.pycache

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init --path)"

source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash
# source /usr/share/bash-completion/completions/fzf
export FZF_DEFAULT_COMMAND='fdfind --type file'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --multi"

export DENO_INSTALL="/home/o/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

GREEN="\[$(tput setaf 199)\]"
BOLD="\[\e[1m\]"
RESET="\[$(tput sgr0)\]"
export PS1="${BOLD}${GREEN}${debian_chroot:+($debian_chroot)}\w | ${RESET}"
if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi

# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
# elif [[ "$OSTYPE" == "darwin"* ]]; then
# else
#     echo ".profile: OS not detected" 
# fi
