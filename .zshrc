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
    echo "$branch "
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst
NEWLINE=$'\n'
PROMPT='%F{cyan}%1~ %F{yellow}$(git_branch_name)%F{white}${NEWLINE}>%f '

# Prompt Enhancement / Card + Time
# Card Calendar plugin - see: https://github.com/codingLogan/card-calendar-prompt
source ~/dev/card-calendar-prompt/prompt.sh
PROMPT="%(?.%F{black}%K{green}.%F{white}%K{red}) \$(get_calendar_card) %t %k $PROMPT"
# ---- PROMPT SETUP ---- #


# --- ALTERNATIVE PROMPT SETUP --- #

month=$(date +%m)

if [[ $month -le 2 || $month -eq 12 ]]; then
    # Winter = Jan, Feb, December
    theme="winter"

    color_time=14
    color_name=39
    color_dir=45
    color_cursor=51
elif [[ $month -le 5 ]]; then
    # Spring = March, April, May
    theme="spring"

    color_time=110
    color_name=112
    color_dir=118
    color_cursor=170
elif [[ $month -le 8 ]]; then
    # Summer = June, July, Aug,
    theme="summer"

    color_time=220
    color_name=223
    color_dir=226
    color_cursor=229
else
    # Fall = Sept, Oct, Nov
    theme="fall"

    color_time=202
    color_name=208
    color_dir=202
    color_cursor=220
fi

# Enable substitution in the prompt.
setopt prompt_subst

# Prompt Enhancement / Card + Time
# Card Calendar plugin - see: https://github.com/codingLogan/card-calendar-prompt
source ~/dev/card-calendar-prompt/prompt.sh
PROMPT='%(?.%F{green}√.%F{red}X) $(get_calendar_card)%f %F{black}%K{$color_time} %* %k%K{$color_name} %n %k%K{$color_dir} %~ %k%K{$color_cursor} → $(git_branch_name)%k%f '
# --- END ALTERNATIVE PROMPT SETUP --- #


# ---- Custom functions --- #
# use 'pomo' in the terminal to start it
pomo() {
  clear
  date
  echo "25 minute pomodoro.\n"
  for i in $(seq 1 25);
  do
      lrprogress $i 25
      sleep 60
  done
  echo "\n\nPomodoro complete!\n"
  afplay /System/Library/Sounds/Hero.aiff
  afplay /System/Library/Sounds/Hero.aiff
  afplay /System/Library/Sounds/Hero.aiff
}

# lrprogress <current> <total>
lrprogress() {

  # Color variables
  red='\033[0;31m'
  green='\033[0;32m'
  yellow='\033[0;33m'
  blue='\033[0;34m'
  magenta='\033[0;35m'
  cyan='\033[0;36m'
  # Clear the color after that
  clear='\033[0m'

  CURRENT=$1
  MAX=$2
  printf "\r${green}["

  for i in $(seq $MAX); do
    if [ "$i" -le "$CURRENT" ]; then
      printf ":"
    else
      printf "-"
    fi
  done

  printf "]${clear} "
  printf "${cyan}$CURRENT / $MAX${clear}"
}
# ---- Custom functions --- #

# ---- MY ALIASES ---- #
# Shortcut to getting the most recent master/main checked out
alias {gm,git-master}='git fetch && git checkout master && git pull'
alias {gmn,git-main}='git fetch && git checkout main && git pull'

# Handy shortcut for running ruby commands
alias bx='bundle exec'

# Because I pretty much always want -a
alias ls='ls -a --color=auto'

# Open up .zshrc quickly with a command
alias aliase='code ~/.zshrc'

# Run a fresh install and start the dev server
alias npmc='npm ci && npm run dev'

# ---- MY ALIASES ---- #
