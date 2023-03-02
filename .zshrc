# --- COLORS for BASH --- #
COLOR_CLEAR='\[\e[00m\]'
BOLD='\[\e[1m\]'

FG_DEFAULT='\[\e[39m\]'
FG_BLACK='\[\e[30m\]'
FG_RED='\[\e[31m\]'
FG_GREEN='\[\e[32m\]'
FG_YELLOW='\[\e[33m\]'
FG_BLUE='\[\e[34m\]'
FG_MAGENTA='\[\e[35m\]'
FG_CYAN='\[\e[36m\]'
FG_LIGHT_GREY='\[\e[37m\]'
FG_DARK_GREY='\[\e[90m\]'

BG_DEFAULT='\[\e[49m\]'
BG_BLACK='\[\e[40m\]'
BG_RED='\[\e[41m\]'
BG_GREEN='\[\e[42m\]'
BG_YELLOW='\[\e[43m\]'
BG_BLUE='\[\e[44m\]'
BG_MAGENTA='\[\e[45m\]'
BG_CYAN='\[\e[46m\]'
BG_LIGHT_GREY='\[\e[47m\]'
BG_DARK_GREY='\[\e[100m\]'

# PS1="${FG_RED}\u ${FG_CYAN}\w ${FG_BLACK}${BG_YELLOW}\$(git_branch_name)${BG_DEFAULT}${FG_YELLOW}\$(print_triangle) ${COLOR_CLEAR}"
# --- END COLORS --- #

# ---- PROMPT SETUP ---- #
# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git branch 2> /dev/null | grep "*" | sed -e s/^\*\ //)
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch')'
  fi
}

function print_triangle()
{
    RIGHT_TRIANGLE="\xe2\x96\xb6"
    printf "${RIGHT_TRIANGLE}"
}

# Enable substitution in the prompt.
setopt prompt_subst

# For Bash with font-triangle
# PS1="${FG_RED}\u ${FG_CYAN}\w ${FG_BLACK}${BG_YELLOW}\$(git_branch_name)${BG_DEFAULT}${FG_YELLOW}\$(print_triangle) ${COLOR_CLEAR}"
PROMPT='%F{red}%n %F{cyan}%~ %F{yellow}%S$(git_branch_name)%s%F{yellow}$(print_triangle) %f'
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
