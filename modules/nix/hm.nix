{ inputs, ... }: {
  flake-file.inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.modules.homeManager.hm = {
    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
  };
}
