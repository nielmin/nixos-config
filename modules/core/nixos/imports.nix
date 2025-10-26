{
  config,
  inputs,
  ...
}:
{
  flake.modules.nixos.core.imports = with config.flake.modules.nixos; [
    agenix
    disko
    facter
    lanzaboote

    bootloader
    nix
    ssh-server
    security
  ];
}
