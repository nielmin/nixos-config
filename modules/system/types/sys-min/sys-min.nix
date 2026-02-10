{ self, ... }:
let
  stateVersion = "26.05";
in
{
  flake.modules.nixos.sys-min = {
    imports = with self.modules.nixos; [
      nix
      nixpkgs
    ];

    system.stateVersion = "${stateVersion}";
  };

  flake.modules.homeManager.system-minimal = {
    home.stateVersion = "${stateVersion}";
  };
}
