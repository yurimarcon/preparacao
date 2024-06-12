#!/bin/bash

CURRENT_BRANCH=$(git branch | grep "^*" | tr -d "* ")

BRANCH=$(git branch | fzf +m \
    --height 100% \
    --layout reverse \
    --border \
    --preview \
        'git -c color.ui=always log --oneline $(echo {} | tr -d " *")' \
    --color bg:#222222,preview-bg:#333333)
BRANCH=$(echo $BRANCH | tr -d " ")

if [ $? -eq 0 ]; then
    git switch "$BRANCH"
else
    echo "No branch selected or operation cancelled."
fi