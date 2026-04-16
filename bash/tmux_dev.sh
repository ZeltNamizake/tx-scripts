#!/usr/bin/env bash

SESSION="dev"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
  tmux new-session -d -s "$SESSION"

  tmux split-window -v -t "$SESSION"
  tmux split-window -h -t "$SESSION"
  tmux select-pane -t "$SESSION":0.0
fi

tmux attach -t "$SESSION"
