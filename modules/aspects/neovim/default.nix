{
  nlm,
  inputs,
  __findFile,
  ...
}: {
  nlm.neovim = {
    includes = [
      <nlm/theme>
    ];
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
        plugins = {
          conform-nvem = {
            enable = true;
            settings = { formatters_by_ft.go = [ "gofumpt" ]; };
          };
          mini-statusline.enable = true;
        };
        lsp.servers.gopls.enable = true;
      };
    };
  };
}
