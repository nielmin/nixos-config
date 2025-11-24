{ inputs, config, ... }:
{
  flake.modules = {
    nixos.quadlet = {
      imports = [
        inputs.quadlet-nix.nixosModules.quadlet
      ];

      virtualisation.quadlet = {
        enable = true;
        autoEscape = true;
        autoUpdate = true;
      };
    };

    homeManager.quadlet = {
      imports = [
        inputs.quadlet-nix.homeManagerModules.quadlet
      ];
    };
  };
}
