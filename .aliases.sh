# Git aliases
alias gm="git checkout master"
alias gch="git chekcout payments/cedric/$1"
alias gp="git pull"
alias grf="git diff --name-status master | awk '{ print \$2 }'"

# Create a branch with payments/cedric in front of the branch name
function gcr () {
    git checkout -b payments/cedric/$1
}

# Bundle aliases
alias be="bundle exec"

# Remove swapfiles
alias cln="find . -type f -name '*.sw[klmnop]' -delete"

# Create a branch with payments/cedric in front of the branch name
function gcr () {
    git checkout -b payments/cedric/$1
}

# Rubocop
alias rh="grf | xargs bundle exec rubocop"

# Awk
alias p1="awk '{ print \$1 }'"
alias p2="awk '{ print \$2 }'"

#  Git checkout PR on upstream
function gcpr () {
    git fetch upstream pull/$1/head:pr/$1 && git checkout pr/$1
}

# Git sync upstream
alias gs="git checkout master && git fetch upstream master && git merge upstream/master && git checkout -"
alias gsb="gs && git rebase master"
