{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      set -g mouse on

      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix

      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D 
      bind k select-pane -U
      bind l select-pane -R

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      set-option -g status-position top

      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window

      # automatic install
      if "test ! -d ~/.tmux/plugins/tpm" \
        "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

      # plugins

      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'christoomey/vim-tmux-navigator'
      set -g @plugin 'tmux-plugins/tmux-yank'
      set -g @plugin 'wfxr/tmux-power'

      # You can set it to a true color in '#RRGGBB' format
      set -g @tmux_power_theme '#cba6f7' # mauve

      # The following colors are used as gradient colors (mapped from dark to light)
      set -g @tmux_power_g0 "#11111b" # base
      set -g @tmux_power_g1 "#1e1e2e" # mantle
      set -g @tmux_power_g2 "#313244" # surface0
      set -g @tmux_power_g3 "#45475a" # surface1
      set -g @tmux_power_g4 "#585b70" # surface2

      run '~/.tmux/plugins/tpm/tpm'

      # set vi-mode
      set-window-option -g mode-keys vi

      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # resize pens alt+shift  
      bind -n M-H resize-pane -L 5
      bind -n M-L resize-pane -R 5
      bind -n M-K resize-pane -U 5
      bind -n M-J resize-pane -D 5

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';
  };
}
