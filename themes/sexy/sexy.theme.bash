# Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Screenshot: http://cloud.gf3.ca/M5rG
# A big thanks to \amethyst on Freenode

if tput setaf 1 &> /dev/null; then
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      MAGENTA=$(tput setaf 9)
      ORANGE=$(tput setaf 172)
      GREEN=$(tput setaf 190)
      PURPLE=$(tput setaf 141)
      WHITE=$(tput setaf 0)
      White="\[\033[0;37m\]" 
      Cyan="\[\033[0;36m\]"
      blue="\033[0;34m"
      lightblue="\033[0;36m"
			IYellow="\e[1;49;33m"
			IGreen="\e[1;49;32m"
    else
      MAGENTA=$(tput setaf 5)
      ORANGE=$(tput setaf 4)
      GREEN=$(tput setaf 2)
      PURPLE=$(tput setaf 1)
      WHITE=$(tput setaf 7)
      White="\[\033[0;37m\]"
      Cyan="\[\033[0;36m\]" 
      blue="\033[0;34m"
      lightblue="\033[0;36m"
			IYellow="\e[1;49;33m"
			IGreen="\e[1;49;32m"
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    White="\[\033[0;37m\]" 
    Cyan="\[\033[0;36m\]" 
    blue="\033[0;34m"
    lightblue="\033[0;36m"
    BOLD=""
    RESET="\033[m"
fi

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

function prompt_command() {
  # PS1="\[${BOLD}${Cyan}\]\u \[$White\]at \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
  # PS1="✨\[${GREEN}\]\u✨ \[$RESET\]in \[$lightblue\]\w\[$RESET\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$RESET\]$(virtualenv_prompt) \n\$ \[$RESET\]"
  PS1="\[$IYellow\]\u\[$IGreen\]@\[$MAGENTA\]\w\[$RESET\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$RESET\]$(virtualenv_prompt) \n\[$IYellow\]>> \[$RESET\]"
}

safe_append_prompt_command prompt_command
