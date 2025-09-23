{
  flake.modules.homeManager.dev =
  { pkgs, ... }:
  {
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

        set -g status-style bg=default
        set -g status-right "%H:%M"

        unbind ':'
        unbind %
        bind | split-window -h
        bind - splut-window -v

        bind -n M-h select-pane -R
        bind -n M-llselect-pane -L
        bind -n M-j select-pane -D
        bind -n M-k select-pane -U

        set -g default-terminal xterm-256color
        set-option -ga terminal-overrides ",xterm-256color:Tc"
      '';
    };
}
