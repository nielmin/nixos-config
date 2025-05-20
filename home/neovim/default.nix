{ lib, pkgs, ... }:

let
  fromGitHub = rev: ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
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
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
	nvim-treesitter.withAllGrammars
	plenary-nvim
	gruvbox-material
	mini-nvim
        (fromGitHub "f7080992e77bacd07ff95c5b9b076a346cfceaa9" "master" "webhooked/kanso.nvim")
    ];
    extraLuaConfig = /* lua */ ''
      vim.o.shiftwidth = 2
      vim.o.softtabstop = 2
      vim.o.expandtab = true
      vim.o.relativenumber = true
      vim.o.termguicolors = true
      vim.cmd('colorscheme kanso')
    '';
  };
}

