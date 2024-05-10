# Automagically sets window name by programs
set -g @plugin 'ofirgall/tmux-window-name'

# Restore tmux sessions on startup
set -g @plugin 'tmux-plugins/tmux-resurrect'

# Save tmux sessions in background
set -g @plugin 'tmux-plugins/tmux-continuum'

# Improve mouse usability
set -g @plugin 'nhdaly/tmux-better-mouse-mode'

# Fuzzy find text to copy/insert
set -g @plugin 'laktak/extrakto'

##### roosta/tmux-fuzzback #####
# Search line to jump to with fzf
set -g @fuzzback-bind f # (<prefix> f)
set -g @plugin 'roosta/tmux-fuzzback'

##### tmux-plugins/tmux-open #####
# Bind: "o" in copy mode to open selected text
# "s" to open selected text in google search
set -g @open-s 'https://www.google.com/search?q='
set -g @plugin 'tmux-plugins/tmux-open'

##### wfxr/tmux-fzf-url #####
# Select url to open with fzf
set -g @fzf-url-bind 'u' # (<prefix> u)
set -g @plugin 'wfxr/tmux-fzf-url'

# Jump to a word like vimium <prefix> j
set -g @plugin 'schasse/tmux-jump'

# Select text to insert from a configured file
# Bind: M-m (alt+m)
# TODO: configure the custom-macros
set -g @plugin 'Neo-Oli/tmux-text-macros'

# Execute tmux commands easily with fzf menu's
# Bind: <prefix> F (shift+f)
set -g @plugin 'sainnhe/tmux-fzf'

# Open a browser sesison attached to the current session
# Bind: <prefix> b
set -g @plugin 'ofirgall/tmux-browser'

# Notify when a long command finish on a remote ssh
# Binds:
#   Start monitoring <prefix> m
#   Stop monitoring  <prefix> M
#   Start monitoring & focus when finish <prefix> M-m (alt+m)
set -g @plugin 'ofirgall/tmux-notify'

##### MunifTanjim/tmux-suspend #####
# Suspend client session to focus on nested ssh session (Alt+Enter)
set -g @suspend_key 'M-Enter'
set -g @plugin 'MunifTanjim/tmux-suspend'

##### ofirgall/tmux_capture_last_command_output #####
# Edit last command ran (doesn't work on all prompts)
set -g @command-capture-key l # (<prefix> l)
set -g @plugin 'ofirgall/tmux_capture_last_command_output'


# RUN TPM
run '$HOME/.tmux/plugins/tpm/tpm'
