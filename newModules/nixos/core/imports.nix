{ config, inputs, ... }:
{
  flake.modules.nixos.core.imports = with config.flake.modules.nixos; [
    inputs.disko.nixosModules.disko
    inputs.lanzaboote.nixosModules.lanzaboote

    bootloader
    nix
    ssh-server
    security
  ];
}
