{ pkgs, ... }:

{
  programs.nvf = {
    enable = true;

    settings = {
        vim = {
          viAlias = false;
          vimAlias = true;
          options = {
            shiftwidth = 2;
            tabstop = 2;
          };
        };
    };
  };
}

