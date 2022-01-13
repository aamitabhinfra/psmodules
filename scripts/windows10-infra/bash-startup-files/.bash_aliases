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
alias dkcoatt='docker container attach'
alias dkcocp='docker container cp'
alias dkcocre='docker container create'
alias dkcoexe='docker container exec'
alias dkcoins='docker container inspect'
alias dkcokil='docker container kill'
alias dkcolog='docker container logs'
alias dkcols='docker container ls'
alias dkcopau='docker container pause'
alias dkcores='docker container restart'
alias dkcorm='docker container rm'
alias dkcorun='docker container run'
alias dkcosta='docker container start'
alias dkcosto='docker container stop'
alias dkcostats='docker container stats'
alias dkcotop='docker container top'

# Conda aliases
alias col='conda env list'
coa() { conda activate "$1"; }
cod() { conda deactivate; }
