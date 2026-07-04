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
      environment.systemPackages = [config.wrappers.niri.package];
    };

    homeManager = {pkgs, ...}: {};
  };
}
