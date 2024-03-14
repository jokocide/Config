export PATH=~/.bin:/.dotnet/tools/:~/.composer/vendor/bin:/Applications/MAMP/Library/bin:~/.npm-global/bin:/usr/local/share/dotnet/x64:~/.go/bin:$PATH
export EDITOR=nvim
alias serve='python3 -m http.server'

function macdisk() {
	if ! command -v smartctl &> /dev/null
	then
		echo "smartctl is not in path, maybe try <brew install smartmontools>"
		return
	fi
	smartctl --all /dev/disk0
}

# OS-specific aliases
case "$(uname -s)" in
    Darwin*)
	alias lsblk="diskutil list"
	alias disk="macdisk"
  alias ip='ifconfig | grep 192.168.86.'
	;;
esac

alias ll='ls -l'
alias ports='lsof -iTCP -sTCP:LISTEN -n -P'

# Search web via Google
google() {
    if [[ -z "$1" ]]; then
        echo "usage: search <query>"
        return 1
    fi
    query=$(echo "$1" | sed 's/ /+/g')
    if [[ $(uname) == "Darwin" ]]; then
        open "https://www.google.com/search?q=$query"  # macOS
    elif [[ $(uname) == "Linux" ]]; then
        xdg-open "https://www.google.com/search?q=$query"  # Linux
    else
        echo "unsupported operating system"
        return 1
    fi
}

# Neovim
alias n="nvim"

#.NET
alias nuget="mono /usr/local/bin/nuget.exe"

# Git
alias g="git"
alias gb="git branch"
alias gc="git checkout"
alias grs="git remote show"
alias ga="git add"
alias gs="git status"
alias gm="git commit -m"
alias gp="git push"

# Node/NPM
alias nr="npm run"

# React
alias rd="react-devtools"

# Go
export GOPATH=~/.go
alias gr="go run *.go"

# Docker
alias dc='docker container'
alias di='docker image'
alias dp='docker rmi -f $(docker images -a -q)'
alias dpr='docker system prune'
