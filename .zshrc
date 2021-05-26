# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
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

# Shortcut to getting the most recent master/main checked out
alias git-master='git fetch && git checkout master && git pull'
alias git-main='git fetch && git checkout main && git pull'

# Because I pretty much always want -al
alias ls='ls -al'
