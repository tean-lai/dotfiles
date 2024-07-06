#!/bin/sh
echo "1) nixos"
echo "2) macos"
home-manager switch --flake .#macos
