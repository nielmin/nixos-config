{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    terminal = "tmux-256color";
    mouse = true;
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      set -g renumber-windows on
      set -g renumber-windows on

      # Customize status bar
      set -g status-style bg=default
      set -g status-right "%H:%M"

      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window
    '';
  };
}
