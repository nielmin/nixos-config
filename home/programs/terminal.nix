{ pkgs, ... }:

let
  font = "Fira Code Nerd Font";
in
{
  catppuccin.alacritty.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
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
