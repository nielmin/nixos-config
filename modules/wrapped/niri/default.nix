{
  nlm,
  inputs,
  ...
}: {
  nlm.niri = {
    nixos = {
      pkgs,
      lib,
      config,
      ...
    }: {
      imports = [
        inputs.nix-wrapper-modules.nixosModules.niri
      ];

      wrappers.niri = {
        enable = true;
        "config.kdl".path = ./config.kdl;
      };
    };

    hjem = {pkgs, ...}: {
      files = {
        ".config/niri/config.kdl".source = ./config.kdl;
      };
    };
  };
}
