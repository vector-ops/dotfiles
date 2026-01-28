# go binary
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin 

# zsh plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# NVM init
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# package installer aliases
alias gimme='sudo dnf install -y'
alias hab="sudo dnf search"
alias lowdiff="sudo dnf remove -y"
alias task=go-task
