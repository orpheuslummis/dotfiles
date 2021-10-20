source $HOME/.profile

# Nicest GNU coreutils feature: tweak the legibility of df, du and ls
export BLOCK_SIZE=si

export EDITOR='code'

alias e='$EDITOR'
alias g='git'
alias now='date +"%Y-%m-%d %H%M %Z"'
alias l='ls -lh'
alias la='ls -lha'
alias ..='cd ..'

setopt AUTO_CD # Change into a dir. by typing its name
setopt CHASE_LINKS # Resolve symbolic paths for cd
setopt CORRECT # Try to correct the spelling of commands
#setopt CORRECT_ALL # Try to correct the spelling of all arguments
#setopt C_BASES # Output hex in 0XFF format (instead of the default 16#FF)
setopt EXTENDED_GLOB # Globbing²
setopt HASH_LIST_ALL # Ensure the command path is hashed, for correctness
setopt INTERACTIVE_COMMENTS # Allow comments in interactive mode
setopt LIST_ROWS_FIRST # Menu completion sorted horizontally
setopt HIST_VERIFY # "Verify" line in editing buffer after history expansion
setopt LONG_LIST_JOBS # List jobs in the "long format"
setopt NOCLOBBER # Do not overwrite existing files
setopt NOTIFY # Report status of bg jobs immediately
setopt NOBEEP # Don't beep on error in ZLE
setopt PRINT_EXIT_VALUE # Print non-zero statuses
#setopt SOURCE_TRACE # Announce the name of each file zsh loads (debugging)

# / not considered a word, allows finer backward word deletion
WORDCHARS=${WORDCHARS//\/}

# Useful bits
zmodload zsh/mathfunc
autoload -U zargs
autoload -U zmv
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Bashesque fin-grained Ctrl-W
autoload -U select-word-style
select-word-style bash

# History
setopt EXTENDED_HISTORY # save timestamp and duration of commands
setopt HIST_IGNORE_SPACE # remove lines beginning with a space
setopt INC_APPEND_HISTORY # incrementally append lines to common history
setopt HIST_EXPIRE_DUPS_FIRST
setopt NO_HIST_SAVE_BY_COPY # $HISTFILE can be a symlink, but if zsh crashes while saving data can be lost
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000 # max size of internal history
SAVEHIST=1000000 # max size of $HISTFILE

# Completion
setopt AUTO_MENU # Show completion menu on successive tab presses
setopt COMPLETE_IN_WORD # Complete commands anywhere in the word
setopt ALWAYS_TO_END # Move cursor to end after completion
zmodload -i zsh/complist
autoload -U compinit && compinit
# + caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path $XDG_CACHE_HOME/zsh/
# make zsh rehash before any completion
#zstyle ":completion:*:commands" rehash 1
# + case-insentivity
 zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Emacs-style emulation by default, vi-style two keys away
#bindkey -e
#bindkey 'jk' vi-cmd-mode
#bindkey -v

# Key bindings
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward
bindkey '^[[3~' delete-char
#bindkey '^[[1;3D' backward-word
#bindkey '^[[1;3C' forward-word

# Key bindings for gnome term + tmux
# bindkey '^[[1~' beginning-of-line
# bindkey '^[[4~' end-of-line
# bindkey '^[[1;5D' backward-word
# bindkey '^[[1;5C' forward-word

# Key bindings for vscode
#bindkey '^[[H' beginning-of-line
#bindkey '^[[F' end-of-line
#bindkey '^[[1;5D' backward-word
#bindkey '^[[1;5C' forward-word
#bindkey '^[[5~' forward-word # PgUp
#bindkey '^[[6~' backward-word # PgDn

# vscode 2020
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

export PATH="$PATH:$HOME/bin/"

alias idr='idris2 -q'