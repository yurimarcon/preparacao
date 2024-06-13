#!/bin/bash

options=(\
    "1 - Switch branch" \
    "2 - Git merge" \
    "3 - Delete branch" \
    "Sair")

selected=$(for op in "${options[@]}" ; do echo $op ; done | fzf +m \
    --height 40% \
    --layout reverse \
    --border)

case "$selected" in
    ${options[0]})
        echo "$selected"
        ./scripts/g-s-branch.sh
        exit 0
    ;;
    ${options[1]})
        echo "$selected"
        ./scripts/g-merge.sh
        exit 0
    ;;
    ${options[2]})
        echo "$selected"
        ./scripts/g-d-branch.sh
        exit 0
    ;;
    ${options[3]})
        echo "Saindo..."
        exit 0
    ;;
    *)
        echo "Opção inválida"
        exit 1
    ;;
esac
