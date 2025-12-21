#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

# variables
#
#
# variables


# exports
#
export EDITOR=hx

# go binaries
#export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# neovim
#export PATH="$PATH:/opt/nvim-linux64/bin"

# java
#export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"

# local/bin
export PATH=$PATH:$HOME/.local/bin


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



# exports end


# aliases
alias fz='fzf --preview "bat --style=header --color=always --line-range :50 {}" --preview-window=right:60% | xargs open'
alias cd=z
alias zource="source ~/.zshrc"
alias zshrc="nvim ~/.zshrc"
alias ghostty="nvim ~/.config/ghostty/config"
alias lg=lazygit
alias zombies="ps ax -o pid,ppid,user,cmd,state,%cpu,%mem | awk '/ Z |PID/&&!/awk/ {print}'"
alias ls="eza --long --group-directories-first --color=always --icons=always --no-user"
alias grep="rg --color=auto"
alias golint=golangci-lint
alias lzd='lazydocker'

# package installer aliases
alias gimme='brew install'
alias hab="brew search"
alias lowdiff="brew uninstall"

# bat aliases
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# git aliases
alias gs="git status --short"
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias ga="git add"
alias gap="git add --patch"
alias gds="git diff staged"
alias gc="git commit"
alias gch="git checkout"
alias gp="git push"
alias gu="git pull"
alias gl="git log --all --graph --pretty=\
  format: '%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n'"
alias gb="git branch"
alias gi="git init"
alias gcl="git clone"
alias gsw="git switch"


# Work aliases
alias products-ssh="ssh -i ~/Documents/YourToken/privatekeys/product-server-key.pem azureuser@20.244.82.114"

#aliases end

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD


# Ultramarine ZSH config
# initialize starship
eval "$(starship init zsh)"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Ctrl + Arrow keybindings
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# Option + Arrow keybindings (macos)
bindkey "^[b" backward-word   # Option + Left Arrow
bindkey "^[f" forward-word    # Option + Right Arrow


# Ctrl + Backspace/Delete Kebindings
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

# ALt + Backspace/Delete Keybinds
# bindkey "^[[3~" delete-char
# bindkey -M emacs '^[[3;3~' kill-word

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt SHARE_HISTORY

eval "$(zoxide init zsh)"

#-------
# the fuck eval
eval 
            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }
        
source <(fzf --zsh)
# -------
# yazi change working directory when quit
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}



# remove duplicates from path
PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
