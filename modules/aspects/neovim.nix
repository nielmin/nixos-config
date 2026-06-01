{
  nlm,
  inputs,
  ...
}: {
  nlm.neovim = {
    homeManager = {pkgs, ...}: {
      imports = [
        inputs.nixvim.homeModules.nixvim
      ];
      programs.nixvim = {
        enable = true;
        defaultEditor = true;
	withPython3 = false;
	withRuby = false;
        opts = {
          colorcolumn = "80";
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
          cursorline = true;
          scrolloff = 8;
          inccommand = "nosplit";
          undofile = true;
          completeopt = ["menuone" "popup" "noinsert"];
          hlsearch = false;
        };
      };
    };
  };
}
