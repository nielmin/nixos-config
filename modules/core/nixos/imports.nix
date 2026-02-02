{
  config,
  inputs,
  ...
}:
{
  flake.modules.nixos.core.imports = with config.flake.modules.nixos; [
    inputs.disko.nixosModules.disko

    agenix
    bootloader
    disko
    facter
    lanzaboote
    nix
    security
    ssh-server
    daniel
  ];
}
