set -g @continuum-restore 'on'
set -g @continuum-save-interval '1'
set -g @emulate-scroll-for-no-mouse-alternate-buffer "on"
set -g @tnotify-verbose 'on'
set -g @tnotify-verbose-msg '#S: #I #W is done!'
set -g @fzf-url-fzf-options '--reverse'
set -g @fuzzback-fzf-layout 'default'
set -g @command-capture-prompt-pattern ' $ '
set -g @thumbs-command 'echo -n {} | $HOME/dotfiles_scripts/misc/toclip; tmux display-message "Copied {}"'
set -g @resurrect-processes 'false' # Dont restore programs
set -g @tnotify-sleep-duration '2'
set -g @tmux_window_name_ignored_programs "['sqlite3']"
set -g @tmux_window_name_dir_programs "['nvim', 'git', 'kv']"
set -g @ttm-load-default-macros off # no default macros
set -g @ttm-window-mode 'vertical'
set -g @extrakto_split_direction 'p'
set -g @extrakto_popup_size '50%'
set -g @extrakto_grab_area 'window full'
set -g @extrakto_insert_key 'enter'
