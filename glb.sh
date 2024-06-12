#!/bin/bash

# git switch $( git branch | fzf --height 40% --layout reverse --border --inline-info)
# git switch $( git branch | fzf)

git switch $( git branch | fzf +m --height 40% --layout reverse --border  --preview 'git diff $(echo {} | tr -d " *")')