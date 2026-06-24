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
          config_directory = ./config;
          dont_link = false;
          compile_generated_lua = true;
        };

        wrapperPaths.input = with pkgs; [
          ripgrep
          fd
          git

          gopls
          lua-language-server
          stylua
        ];

        specs = {
          conform-nvim = {
            enable = true;
            data = pkgs.vimPlugins.conform-nvim;
          };

          koda-nvim = {
            enable = true;
            data = pkgs.vimPlugins.koda-nvim;
          };

          mini-nvim = {
            enable = true;
            data = pkgs.vimPlugins.mini-nvim;
          };
        };
      };

      environment.systemPackages = [ config.wrappers.neovim.package ];
    };

    homeManager = {pkgs, ...}: {};
  };
}
