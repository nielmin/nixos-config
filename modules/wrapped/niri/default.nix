{inputs, ...}: {
  nlm.niri = {
    nixos = {...}: {
      imports = [
        inputs.nix-wrapper-modules.nixosModules.niri
      ];

      wrappers.niri = {
        enable = true;
        "config.kdl".path = ./config.kdl;
      };
    };

    homeManager = {...}: {
      xdg.configFile."niri/config.kdl".source = ./config.kdl;
    };
  };
}
