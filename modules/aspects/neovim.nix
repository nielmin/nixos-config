{nlm, inputs, ...}: {
  nlm.neovim = {
    homeManager = {pkgs, ...}: {
      imports = [
        inputs.nixvim.homeModules.nixvim
      ];
      programs.nixvim = {
        enable = true;
				defaultEditor = true;
    		opts = {
					guicursor = "i:block";
					colorcolumn = "80";
					signcolumn = "yes:1";
					termguicolors = true;
					ignorecase = true; 
					swapfile = false; 
					autoindent = true; 
					expandtab = true; 
					tabstop = 2; 
					softtabstop = 2;
					shiftwidth = 2; 
					shiftround = true;
					list = true; 
					number = true;
					relativenumber = true;
					numberwidth = 2; 
					wrap = false; 
					cursorline = true ;
					scrolloff = 8; 
					inccommand = "nosplit";
					undofile = true; 
					complete= [ "menuone" "popup" "noinsert"];
					winborder = "rounded";
					hlsearch = false; 
    		};
      };
    };
  };
}
