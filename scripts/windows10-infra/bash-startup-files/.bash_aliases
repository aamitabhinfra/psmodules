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
alias doimbui='docker image build'
alias doimhis='docker image history'
alias doimins='docker image inspect'
alias doimls='docker image ls'
alias doimpru='docker image prune'
alias doimpus='docker image push'
alias doimpul='docker image pull'
alias doimrm='docker image rm'
alias doimtag='docker image tag'
#   Container aliases
alias docoatt='docker container attach'
alias dococp='docker container cp'
alias dococre='docker container create'
alias docoexe='docker container exec'
alias docoins='docker container inspect'
alias docokil='docker container kill'
alias docolog='docker container logs'
alias docols='docker container ls'
alias docopau='docker container pause'
alias docores='docker container restart'
alias docorm='docker container rm'
alias docorun='docker container run'
alias docosta='docker container start'
alias docosto='docker container stop'
alias docostats='docker container stats'
alias docotop='docker container top'
#   System aliases
alias dosysdf='docker system df'
alias dosyspru='docker system prune'

# Conda aliases
alias col='conda env list'
coa() { conda activate "$1"; }
cod() { conda deactivate; }
