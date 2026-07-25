{nlm, inputs, ...}: {
  nlm.homelab = {
    nixos = {pkgs, config, user, ...}: {
      imports = [
        inputs.quadlet-nix.nixosModules.quadlet
      ];
    };
  };
}
