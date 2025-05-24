{ pkgs, ... }:

let
  font = "Fira Code Nerd Font";
in
{
  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      colors = {
        # Kanso Zen Alacritty Colors

        primary = {
          background = "#090E13";
          foreground = "#C5C9C7";
        };

        normal = {
          black = "#090E13";
          red = "#c4746e";
          green = "#8a9a7b";
          yellow = "#c4b28a";
          blue = "#8ba4b0";
          magenta = "#a292a3";
          cyan = "#8ea4a2";
          white = "#c8c093";
        };

        bright = {
          black = "#A4A7A4";
          red = "#e46876";
          green = "#87a987";
          yellow = "#e6c384";
          blue = "#7fb4ca";
          magenta = "#938aa9";
          cyan = "#7aa89f";
          white = "#C5C9C7";
        };

        selection = {
          background = "#393B42";
          foreground = "#C5C9C7";
        };

        # indexed_colors = {
        #   index = 16;
        #   color = "#b6927b";
        # };

        # indexed_colors = {
        #   index = 17;
        #   color = "#b98d7b";
        # };
      };
      window.dynamic_padding = true;
      window.padding = {
	x = 5;
	y = 5;
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
}
