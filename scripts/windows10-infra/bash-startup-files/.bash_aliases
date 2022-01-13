# No need for export.  Manually defined in PowerShell as the first step
# export REPO_HOME=~/source/repos
alias cdr='cd $REPO_HOME'

# Git aliases
alias glo='git log --all --decorate --oneline --graph'
alias gst='git status'
gco() { git checkout "$1"; }
alias gaa='git add -A .'
gcm() { git commit -m "$1"; }
gamp() { git add -A . ; git commit -m "$1" ; git push ; }
alias az='az.cmd'

# Programs aliases
alias python='winpty python.exe'
alias sqlite3='winpty sqlite3.exe'

# Docker aliases
#   Image aliases
alias dkimbui='docker image build'
alias dkimhis='docker image history'
alias dkimins='docker image inspect'
alias dkimls='docker image ls'
alias dkimpru='docker image prune'
alias dkimpus='docker image push'
alias dkimpul='docker image pull'
alias dkimrm='docker image rm'
alias dkimtag='docker image tag'
#   Container aliases
alias dkimbui='docker image build'

# Conda aliases
alias col='conda env list'
coa() { conda activate "$1"; }
cod() { conda deactivate; }
