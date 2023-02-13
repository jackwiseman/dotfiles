#!/bin/bash

# .tmux.conf hash: {{ include ".tmux.conf" | sha256sum }}

tmux source $HOME/.tmux.conf
