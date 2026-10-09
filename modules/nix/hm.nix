{
  flake-file.inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake.modules.nixos.hm = {
    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
  };
}
