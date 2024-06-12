#!/bin/bash

CURRENT_BRANCH=$(git branch | grep "^*" | tr -d "* ")

BRANCH=$(git branch | fzf +m \
    --height 100% \
    --layout reverse \
    --border \
    --preview \
        'git -c color.ui=always log --oneline $(echo {} | tr -d " *")' \
    --color bg:#222222,preview-bg:#333333)

if [ $? -eq 130 ]; then
    echo "No branch selected or operation cancelled."
fi

BRANCH=$(echo $BRANCH | tr -d " ")
git switch "$BRANCH"