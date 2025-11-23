{ inputs, config, ... }:
{
  flake.modules = {
    imports = [
      inputs.quadlet-nix.nixosModules.quadlet
    ];

    virtualisation.quadlet.enable = true;

    nixos.homelab.imports = with config.flake.modules.nixos; [
    ];

    homeManager.homelab.imports = with config.flake.modules.homeManager; [
      jellyfin
    ];
  };
}
