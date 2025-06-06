{
  catppuccin.tmux.enable = true;

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    terminal = "xterm-256color";
    prefix = "C-a";
    mouse = true;
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      set -g renumber-windows on
      set -g renumber-windows on

      # Customize status bar
      set -g status-style bg=default
      set -g status-right "%H:%M"

      unbind '"'
      unbind %
      bind | split-window -h
      bind - split-window -v

      # Shift Alt vim keys to select pane
      bind -n M-H select-pane -R
      bind -n M-L select-pane -L
      bind -n M-J select-pane -D
      bind -n M-K select-pane -U

      set -g default-terminal xterm-256color
      set-option -ga terminal-overrides ",xterm-256color:Tc"
    '';
  };
}
