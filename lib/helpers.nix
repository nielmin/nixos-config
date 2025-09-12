{ nixpkgs, overlays, inputs }:

name:
{
  system,
  user,
  darwin ? false,
  wsl ? false
}:

let
  isLinux = !darwin;

  hostConfig = ../hosts/${name};
  userOSConfig = ../users/${user}/nixos.nix;
  userHMConfig = ../users/${user}/home.nix

  systemFunc = nixpkgs.lib.nixosSystem;
  home-manager = inputs.home-manager.nixosModules;

in systemFunc rec {
  inherit system;

  modules = [
    machineConfig
    userOSConfig
    home-manager.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import userHMConfig {
        inputs = inputs;
      };
    }


  {
    config._module.args = {
      currentSystem = system;
      currentSystemName = name;
      currentSystemUser = user;
      inputs = inputs;
    };
  }
  ];
}
  
