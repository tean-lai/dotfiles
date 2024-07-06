#!/bin/sh

display_options() {
  echo "1) nixos"
  echo "2) macos"
}

run_command() {
  case "$1" in 
    1|nixos) 
      sh -c "home-manager switch --flake .#nixos"
      ;;
    2|macos) 
      sh -c "home-manager switch --flake .#nixos"
      ;;
    *)
      echo "invalid option. aborting the script."
      exit 1
      ;;
  esac
}

if [ $# -eq 0 ]; then 
  display_options
  echo "enter your choice: "
  read choice
  run_command "$choice"
else
  run_command "$1"
fi


