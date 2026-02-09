{ self, ... }:
let
  stateVersion = "24.11";
in
{
  flake.modules.nixos.state = {
    system.stateVersion = "${stateVersion}";
  };

  flake.modules.homeManager.state = {
    home.stateVersion = "${stateVersion}";
  };
}
