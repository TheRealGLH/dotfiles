#Delete word bash style
autoload -U select-word-style
select-word-style bash
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
#Hack for MacOS
if ! type "dircolors" > /dev/null; then
    alias dircolors=gdircolors
fi
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -a -l"
alias nvi="nvim --noplugins"

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/games:/opt/nvim-linux64/bin:~/.local/bin:/snap/bin:/home/martijn/.cargo/bin:/opt/homebrew/bin:$PATH"
eval "$(oh-my-posh init zsh --config ~/dracula-modified.omp.json)"
# enable color support of ls and also add handy aliases
if [[ (-x /usr/bin/dircolors) || (-x /opt/homebrew/bin/gdircolors) ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias watch='watch '
alias dps='docker ps --format "table {{.Names}}\t{{.ID}}\t{{.Command}}\t{{.CreatedAt}}"'
alias dpsa='docker ps --format "table {{.Names}}\t{{.ID}}\t{{.Image}}\\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}" -a'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
setopt IGNORE_EOF
unsetopt ignoreeof
setopt ignore_eof

# Load seperated config files
for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
  source "${conf}"
done
unset conf

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#GPG config
export GPG_TTY=$(tty)

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:-1,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --border="bold" --border-label="" --preview-window="border-sharp" --prompt="> "
  --marker=">" --pointer=" " --separator="─" --scrollbar="│"
  --layout="reverse-list" --info="right"'

zinit light Aloxaf/fzf-tab
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' fzf-pad 4
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

