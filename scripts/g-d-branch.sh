#!/bin/bash

CURRENT_BRANCH=$(git branch | grep "^*" | tr -d "* ")

BRANCH=$(git branch | fzf -m \
    --height 100% \
    --layout reverse \
    --border \
    --preview \
        'git -c color.ui=always log --oneline $(echo {} | tr -d "*")' \
    --print-query \
    --color bg:#222222,preview-bg:#333333)

if [ $? -eq 130 ]; then
    echo "No branch selected or operation cancelled."
    exit 1
fi

if [ "$BRANCH" == "* $CURRENT_BRANCH" ]; then
    echo "You can not delete the current branch."
    exit 1
fi

git branch -D $BRANCH
