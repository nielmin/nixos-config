{
  nlm,
  inputs,
  ...
}: {
  nlm.neovim = {
    nixos = {
      pkgs,
      lib,
      config,
      ...
    }: {
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
          conform-nvim.data = pkgs.vimPlugins.conform-nvim;
          koda-nvim.data = pkgs.vimPlugins.koda-nvim;
          mini-nvim.data = pkgs.vimPlugins.mini-nvim;
        };
      };

      environment.systemPackages = [config.wrappers.neovim.package];
      environment.variables = {
        EDITOR = "${config.wrappers.neovim.package}/bin/nvim";
        VISUAL = "${config.wrappers.neovim.package}/bin/nvim";
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
