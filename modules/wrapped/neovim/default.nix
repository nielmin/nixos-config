{
  nlm,
    inputs,
    ...
}: {
  nlm.neovim = {
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

        wrapperPaths.input = with pkgs; [
          ripgrep
          fd
          git

          gopls
          lua-language-server
        ];

        specs = {
          conform-nvim = {
            enable = true;
            data = pkgs.vimPlugins.conform-nvim;
            type = "lua";
            config = builtins.readFile ./conform.lua;
          };

          koda-nvim = {
            enable = true;
            data = pkgs.vimPlugins.koda-nvim;
            config = ''
              require("koda").setup({})
              vim.cmd("colorscheme koda")
              '';
          };

          init-lua = {
            enable = true;
            data = null;
            type= "lua";
            config = builtins.readFile ./init.lua;
          };

          lsp-config = {
            enable = true;
            data = null;
            type= "lua";
            config = builtins.readFile ./lsp.lua;
          };
        };
      };

      environment.systemPackages = [ config.wrappers.neovim.package ];
    };

    homeManager = {pkgs, ...}: {};
  };
}
