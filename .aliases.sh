# Git aliases
alias gm="git checkout master"
alias gp="git pull"
alias grf="git diff --name-status master | awk '{ print \$2 }'"

# Bundle aliases
alias be="bundle exec"

# Remove swapfiles
alias cln="find . -type f -name '*.sw[klmnop]' -delete"

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
