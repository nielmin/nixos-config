{ config, inputs, ... }:
{
  flake.modules.nixos.core.imports = with config.flake.modules.nixos; [
    inputs.disko.nixosModules.disko

    bootloader
    nix
    ssh-server
    users
    security
    packages
    misc
  ];
}
