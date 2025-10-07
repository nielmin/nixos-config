{
  flake.modules.homeManager.tmux =
  { pkgs, ... }:
  {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      terminal = "xterm-256color";
      mouse = true;
      extraConfig = ''
        set-option -ga terminal-overrides ",xterm-256color:Tc"
        set -g default-terminal "xterm-256color"
        
        unbind C-r
        set-option -g prefix `
        bind ` send-prefix
        
        unbind r
        bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"
        
        setw -g pane-base-index 1
        set -g renumber-windows on
        
        # Customize status bar
        set -g status-position top
        set -g status-justify centre
        set -g status-style ""
        set -g status-left ""
        set -g status-right ""
        
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"
        
        # Shift Alt vim keys to switch windows
        bind -n M-H previous-window
        bind -n M-L next-window 
        
      '';
    };
  };
}
