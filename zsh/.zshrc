export PATH=~/.bin:/opt/homebrew/bin:/opt/homebrew/opt/libpq/bin:~/.go/bin:$PATH
export EDITOR=nvim

alias ll='ls -l'
alias ports='lsof -iTCP -sTCP:LISTEN -n -P'

# Neovim
alias n="nvim"

# Git
alias g="git"
alias gb="git branch"
alias gc="git checkout"
alias grs="git remote show"
alias ga="git add"
alias gs="git status"
alias gm="git commit -m"
alias gp="git push"
alias gd="git diff"

# Node/NPM
alias nr="npm run"

# Go
export GOPATH=~/.go
alias gr="go run *.go"
alias grt="go test ./..."

# Zig
alias zbr="zig build run"
alias zbt="zig build test"
alias zbl="zig build -l"

# Docker
alias dc='docker container'
alias di='docker image'
alias dp='docker rmi -f $(docker images -a -q)'
alias dpr='docker system prune'
