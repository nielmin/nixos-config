{
  flake.homeModules.alacritty = {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
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

        colors = {
          primary = {
            background = "#161617";
            foreground = "#c9c7cd";
          };
          cursor = {
            cursor = "#757581";
            text = "#c9c7cd";
          };
          normal = {
            black = "#27272a";
            blue = "#aca1cf";
            cyan = "#ea83a5";
            green = "#90b99f";
            magenta = "#e29eca";
            red = "#f5a191";
            white = "#c1c0d4";
            yellow = "#e6b99d";
          };
          bright = {
            black = "#353539";
            blue = "#b9aeda";
            cyan = "#f591b2";
            green = "#9dc6ac";
            magenta = "#ecaad6";
            red = "#ffae9f";
            white = "#cac9dd";
            yellow = "#f0c5a9";
          };
        };
      };
    };
  };
}
