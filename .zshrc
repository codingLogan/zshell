# ---- PROMPT SETUP ---- #
# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git branch 2> /dev/null | grep "*" | sed -e s/^\*\ //)
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' ('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

PROMPT='%F{red}%n %F{cyan}%~%F{yellow}$(git_branch_name)%F{cyan}> %f'
# ---- PROMPT SETUP ---- #


# ---- MY ALIASES ---- #
# Shortcut to getting the most recent master/main checked out
alias {gm,git-master}='git fetch && git checkout master && git pull'
alias {gmn,git-main}='git fetch && git checkout main && git pull'

# Handy shortcut for running ruby commands
alias bx='bundle exec'

# Because I pretty much always want -al
alias ls='ls -al'

# Open up .zshrc quickly with a command
alias aliase='code ~/.zshrc'
# ---- MY ALIASES ---- #


# ---- WORK ALIASES ---- #
# MX specific related aliases
export DEV_FOLDER="/Users/logan.rasmussen/dev"
alias firefly='PB_CLIENT_TYPE="protobuf/nats/client" bundle exec rails s -b 0.0.0.0'
alias restartfirefly='lsof -t -i tcp:3000 | xargs kill -9'
alias platform='PB_CLIENT_TYPE="protobuf/nats/client" bundle exec rails s -p 4000'
alias connecte='code /Users/logan.rasmussen/dev/curls/papi/sand/loganroauth2'
alias connect='/Users/logan.rasmussen/dev/curls/papi/sand/loganroauth2 | get-url'
alias mdpre='/Users/logan.rasmussen/dev/curls/papi/sand/preinitiated-md'
alias atrium='ruby -rwebrick -e "WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start"'
# ---- WORK ALIASES ---- #
