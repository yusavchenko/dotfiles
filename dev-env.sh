#!/bin/sh

project="manager"

while getopts p: flag
do
    case "${flag}" in
        p) project=${OPTARG};;
    esac
done
echo "Project: $project";

# Set Session Name
SESSION="DEV"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    cd ~/workspace/thunderball

    # Start New Session with our name
    tmux new-session -d -s $SESSION

    tmux rename-window -t 1 'nvim'
    tmux split-window -v -t $SESSION:1 -l 25%
    
    tmux send-keys -t 'nvim.1' C-m "nvim ." C-m
    tmux send-keys -t 'nvim.2' C-m "npm run dev:$project" C-m
    tmux resize-pane -t 'nvim.1' -Z

    # Setup an additional shell
    tmux new-window -t $SESSION:2 -n 'shell'
    tmux send-keys -t 'shell' "zsh" C-m 'clear' C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:1
