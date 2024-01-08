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
  "$@"
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
