{ config, inputs, ... }:
{
  flake.modules.nixos.core.imports = with config.flake.modules.nixos; [
    inputs.lanzaboote.nixosModules.lanzaboote
    disko
    facter

    bootloader
    nix
    ssh-server
    security
  ];
}
