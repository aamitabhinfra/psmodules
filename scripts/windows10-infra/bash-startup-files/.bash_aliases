# for K2FHPC desktop
export REPO_HOME=~/source/repos
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

# Conda aliases
alias col='conda env list'
coa() { conda activate "$1"; }
cod() { conda deactivate; }
