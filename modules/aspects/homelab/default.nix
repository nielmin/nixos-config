{ inputs, ... }: {
  flake.modules.nixos.homelab = {
    imports = [
      inputs.quadlet-nix.nixosModules.quadlet
    ];
  };
}
