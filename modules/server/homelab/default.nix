{ inputs, ... }: {
  flake.modules.nixos.homelab =
    {
      config,
      pkgs,
      ...
    }:
    {
      imports = [
        inputs.quadlet-nix.nixosModules.quadlet
      ];
    };
}
