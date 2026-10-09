{ inputs, ... }: {
  flake.modules.nixos.niri = {
    imports = [
      inputs.nix-wrapper-modules.nixosModules.niri
    ];

    wrappers.niri = {
      enable = true;
      "config.kdl".path = ./config.kdl;
    };
  };

  flake.modules.homeManager.niri = {
    xdg.configFile."niri/config.kdl".source = ./config.kdl;
  };
}
