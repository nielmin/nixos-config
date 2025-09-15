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
          normal.family = font;
          bold.family = font;
          italic.family = font;
          size = 14;
        };
        scrolling.multiplier = 5;
        selection.save_to_clipboard = true;
      };
    };
  };
}
