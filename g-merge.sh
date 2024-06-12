#!/bin/bash

CURRENT_BRANCH=$(git branch | grep "^*" | tr -d "* ")

BRANCH=$(git branch | fzf +m \
    --height 100% \
    --header "Select a branch to Merge in this branch:" \
    --layout reverse \
    --border \
    --preview \
        'git -c color.ui=always diff $(git branch | grep "^*" | tr -d "* ") $(echo {} | tr -d " ")' \
    --color bg:#222222,preview-bg:#333333)

if [ $? -eq 130 ]; then
    echo "No branch selected or operation cancelled."
    exit 1
fi

if [ "$BRANCH" == "* $CURRENT_BRANCH" ]; then
    echo "You can not merge the current branch."
    exit 1
fi

BRANCH=$(echo $BRANCH | tr -d " ")
git merge "$BRANCH"
