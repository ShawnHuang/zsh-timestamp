del-time-prompt-accept-line() {
   zle accept-line
}
zle -N del-time-prompt-accept-line
bindkey "^M" del-time-prompt-accept-line

function preexec() {
  timer=`date '+%H:%M:%S'`
  time_set="1"
}

function precmd() {
  if [ $time_set ]; then
    RPROMPT='[${timer}]-[%*]'
  else
    RPROMPT='[%*]'
    unset timer
  fi
  unset time_set
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec preexec
add-zsh-hook precmd precmd
