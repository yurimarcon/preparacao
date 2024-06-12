#!/bin/bash

BRANCH=$(git branch | fzf +m --height 100% --layout reverse --border --preview 'git -c color.ui=always diff $(echo {} | tr -d " *") | less -R' --color bg:#222222,preview-bg:#333333)

if [ $? -eq 0 ]; then
    git switch "$BRANCH"
else
    echo "No branch selected or operation cancelled."
fi