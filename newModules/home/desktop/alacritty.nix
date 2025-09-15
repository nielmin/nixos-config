{
  flake.modules.homeManager.alacritty = {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          decorations = "None";
          dynamic_padding = true;
          padding = {
            x = 5;
            y = 5;
          };
        };
        scrolling.history = 10000;
        env.TERM = "xterm-256color";
        font = {
          normal.family = "0xProto Nerd Font";
          bold.family = "0xProto Nerd Font";
          italic.family = "0xProto Nerd Font";
          size = 14;
        };
        scrolling.multiplier = 5;
        selection.save_to_clipboard = true;
      };
    };
  };
}
