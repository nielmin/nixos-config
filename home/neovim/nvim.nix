{ pkgs, ... }:

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
    ];
    extraLuaConfig = /* lua */ ''
      vim.o.shiftwidth = 2
      vim.o.softtabstop = 2
      vim.o.expandtab = true
      vim.o.relativenumber = true
      vim.o.termguicolors = true
      vim.cmd('colorscheme gruvbox-material')
      vim.g.gruvbox_material_background = 'hard'
    '';
  };
}

