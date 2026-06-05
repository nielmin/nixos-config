{
  nlm,
  inputs,
  __findFile,
  ...
}: {
  nlm.neovim = {
    includes = [
      <nlm/neovim/theme>
      <nlm/neovim/lsp>
      <nlm/neovim/options>
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
        plugins = {
          conform-nvem = {
            enable = true;
            settings = { formatters_by_ft.go = [ "gofumpt" ]; };
          };
          mini-statusline.enable = true;
          blink-cmp.enable = true;
        };
      };
    };
  };
}
