# Usage

1. Make sure this directory is copied to "/root/curfew.lisp".
2. Run the command `run.sh`.

# Todo

1. Write a tutorial for letting root to run this script automatically at boot.
2. Use `cl-schedule` and service to launch action.
3. Use predicates that are more expressive to launch actions.

# Known Bugs

The function `#'lock-url` has a weird bug; see comment in its
code.
