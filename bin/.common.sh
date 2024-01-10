print_error() {
  echo "$@" >&2
}

command_exists() {
  which $1 &> /dev/null
}

start_bg() {
  if ! command_exists $1; then
    print_error "Command $1 does not exist"
    return
  fi
  nohup "$@" &>/dev/null </dev/null &
}

start_bg_with_delay() {
  (
  local delay=$1
  shift
  sleep "${delay}"
  start_bg "$@"
  ) &> /dev/null </dev/null &
}

run_on_new_terminal() {
  alacritty -e bash -c "${@}"
}

run_on_new_floating_terminal() {
  alacritty --class floating-terminal -e bash -c "${@}"
}
