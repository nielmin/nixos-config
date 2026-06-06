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
      <nlm/neovim/conform>
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
        globals.mapleader = " ";
        keymaps = [
          {
            mode = "n";
            key = "<leader>f";
            action = "<cmd>lua require('conform').format( { async = true })<cr>";
          }
        ];
        plugins = {
          mini-statusline.enable = true;
          blink-cmp.enable = true;
        };
      };
    };
  };
}
