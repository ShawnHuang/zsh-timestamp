
# del-time-prompt-accept-line() {
#   zle accept-line
#}
#zle -N del-time-prompt-accept-line
#bindkey "^M" del-time-prompt-accept-line
function timer_preexec() {
  timer=`date '+%H:%M:%S'`
  time_set=1
  RPROMPT='[${timer} - %*]'
}

function timer_precmd() {
  if [[ $time_set  ]]; then
      RPROMPT='[${timer} - %*]'
  else
      RPROMPT='[%*]'
      unset timer
  fi
  unset time_set
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec timer_preexec
add-zsh-hook precmd timer_precmd
add-zsh-hook -L precmd


# rgs() {
#  eval "$(fc -l -n -1) -l" | tee >(fzf-tmux -d 15 | xclip -selection clipboard) > /dev/null && tmux set-buffer $(xclip -o -sel clipboard)
#}
