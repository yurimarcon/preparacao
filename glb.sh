#!/bin/bash

git switch $( git branch | fzf +m --height 40% --layout reverse --border  --preview 'git diff $(echo {} | tr -d " *")')