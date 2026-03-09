#!/bin/zsh
entry="$1"

if [[ -d "$entry" ]]; then
    # Directory: list contents
    ls -lAhoF --color=always "$entry"
elif [[ -f "$entry" ]]; then
    # File: show contents (use bat if available, otherwise cat)
    if command -v bat &>/dev/null; then
        bat --color=always --style=numbers --line-range=:500 "$entry"
    else
        cat "$entry"
    fi
elif command -v man &>/dev/null && man -w "$entry" &>/dev/null; then
    # Man page: show the manual entry
    man "$entry" 2>/dev/null | col -bx
else
    echo "No preview available for: $entry"
fi
