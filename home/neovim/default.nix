{ lib, pkgs, ... }:

let
  fromGitHub = rev: ref: repo: pkgs.vimUtils.buildVimPlugin {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
        ref = ref;
        rev = rev;
      };
    };
in
{
  catppuccin.nvim.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
	nvim-treesitter.withAllGrammars
	plenary-nvim
	{
          plugin = mini-nvim;
          type = "lua";
          config = ''
            require('mini.icons').setup()
            require('mini.statusline').setup()
            require('mini.git').setup()
            require('mini.diff').setup()
          '';
        }
    ];
    extraLuaConfig = /* lua */ ''
      vim.o.shiftwidth = 2
      vim.o.softtabstop = 2
      vim.o.expandtab = true
      vim.o.relativenumber = true
      vim.o.termguicolors = true
      vim.cmd('colorscheme catppuccin')
    '';
  };
}

