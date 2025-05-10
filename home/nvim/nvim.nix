{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraLuaConfig = ''
      vim.o.shiftwidth = 2
      vim.o.softtabstop = 2
      vim.o.expandtab = true
      vim.o.relativenumber = true
    '';
  };
}

