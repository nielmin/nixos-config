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
          mini = {
            completion.enable = true;
            icons.enable = true;
            statusline.enable = true;
            diff.enable = true;
            git.enable = true;
          };
        };
    };
  };
}

