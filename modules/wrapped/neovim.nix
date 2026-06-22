{
  nlm,
  inputs,
  ...
}: {
  nlm.nvim = {
    nixos = { pkgs, lib, config, ...}: {
      imports = [
        inputs.nix-wrapper-modules.nixosModules.neovim
      ];

      wrappers.neovim = {
        enable = true;
        package = pkgs.neovim-unwrapped;

        settings = {
          dont_link = false;
          compile_generated_lua = true;
        };

	specs = {
	  koda-nvim = {
	    enable = true;
	    package = pkgs.vimPlugins.koda-nvim;
	    config = ''
	      require("koda").setup({})
	      vim.cmd("colorscheme koda")
	    '';
	  };

	  init-lua = {
            enable = true;
	    data = null;
	    type= "lua";
	    config = ''
              vim.g.mapleader = ' '

	      vim.opt.colorcolumn = "80";
              vim.opt.termguicolors = true;
              vim.opt.ignorecase = true;
              vim.opt.swapfile = false;
              vim.opt.autoindent = true;
              vim.opt.expandtab = true;
              vim.opt.tabstop = 2;
              vim.opt.softtabstop = 2;
              vim.opt.shiftwidth = 2;
              vim.opt.shiftround = true;
              vim.opt.list = true;
              vim.opt.number = true;
              vim.opt.relativenumber = true;
              vim.opt.numberwidth = 2;
              vim.opt.wrap = false;
              vim.opt.cursorline = true;
              vim.opt.scrolloff = 8;
              vim.opt.inccommand = "nosplit";
              vim.opt.undofile = true;
              vim.opt.completeopt = {"menuone", "popup", "noinsert"};
              vim.opt.hlsearch = false;
	    '';
	  };
	};
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
