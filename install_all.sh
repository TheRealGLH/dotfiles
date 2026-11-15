#!/bin/sh
# Pre-create dirs that must stay real (not stow-folded symlinks), so tools can write
# their own unmanaged files there (e.g. Claude's account-synced skills).
mkdir -p ~/.claude/skills
stow -v -t ~ *
