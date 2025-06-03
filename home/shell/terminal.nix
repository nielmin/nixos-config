{ pkgs, ... }:

let
  font = "Fira Code Nerd Font";
in
{
  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  catppuccin.alacritty.enable = true;

  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      colors = {
        # Zenbones Zenwritten Dark

        primary = {
          foreground = "#bbbbbb";
          background = "#191919";
        };

        cursor = {
          text = "#191919";
          cursor = "#c9c9c9";
        };

        selection = {
          text = "#bbbbbb";
          background = "#404040";
        };

        normal = {
          black = "#191919";
          red = "#de6e7c";
          green = "#819b69";
          yellow = "#b77e64";
          blue = "#6099c0";
          magenta = "#b279a7";
          cyan = "#66a5ad";
          white = "#bbbbbb";
        };

        bright = {
          black = "#3d3839";
          red = "#e8838f";
          green = "#8bae68";
          yellow = "#d68c67";
          blue = "#61abda";
          magenta = "#cf86c1";
          cyan = "#65b8c1";
          white = "#8e8e8e";
        };

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
