{
  nlm.neovim = {
    nixos = {
      pkgs,
      config,
      user,
      ...
    }: {
      wrappers.neovim = {
        enable = true;
        package = pkgs.neovim-unwrapped;

        settings = {
          config_directory = "/home/${user.userName}/.config/nvim";
        };

        wrapperPaths.input = with pkgs; [
          ripgrep
          fd
          git

          gopls
          lua-language-server
          nixd
          stylua
        ];

        specs = {
          conform-nvim.data = pkgs.vimPlugins.conform-nvim;
          koda-nvim.data = pkgs.vimPlugins.koda-nvim;
          mini-nvim.data = pkgs.vimPlugins.mini-nvim;
          zk-nvim.data = pkgs.vimPlugins.zk-nvim;
        };
      };

      environment = {
        systemPackages = with pkgs; [
          config.wrappers.neovim.package

          harper
          marksman
          zk
        ];
        variables = {
          EDITOR = "${config.wrappers.neovim.package}/bin/nvim";
          VISUAL = "${config.wrappers.neovim.package}/bin/nvim";
        };
      };
    };

    homeManager = {user, ...}: {
      xdg.configFile = {
        "nvim".source = ./config;
      };
    };
  };
}
