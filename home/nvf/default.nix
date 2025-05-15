{ pkgs, lib, config, ... }:

let 
  cfg = config.nvf;
in
{
  options = {
    nvf.enable = lib.mkEnableOption "Enable nvf";
  };

  config = lib.mkIf cfg.enable {
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
  };
}

