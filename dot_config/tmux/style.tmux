# gruvbox
black='#282828'
white='#ebdbb2'
red='#fb4934'
green='#b8bb26'
blue='#83a598'
yellow='#fe8019'
gray='#a89984'
darkgray='#3c3836'
lightgray='#504945'
inactivegray='#7c6f64'

set-option -g status-style bg=$darkgray

set-option -g window-status-current-style fg=$white,bg=$lightgray

set-option -g pane-active-border-style fg=default
set-option -g pane-active-border-style bg=default

set -g status-left ' #h '
set -g status-left-style bg=$blue,fg=$black
set -g status-left-length 30
setw -g window-status-format         ' #(echo "#{pane_current_command}") '
setw -g window-status-current-format ' #(echo "#{pane_current_command}") '
set -g status-right " "
