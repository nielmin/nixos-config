{
  self,
  inputs,
  outputs,
  stateVersion,
  username,
  ...
}:
{
  mkHome =
    {
      hostname,
      user ? username,
      desktop ? null,
      system ? "x86_64-linux",
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit
          self
          inputs
          outputs
          stateVersion
          hostname
          desktop
          ;
        username = user;
      };
      modules = [
        ../users/${username}/home.nix
      ];
    };

  mkHost =
    {
      hostname,
      desktop ? null,
      pkgsInput ? inputs.nixpkgs,
    }:
    pkgsInput.lib.nixosSystem {
      specialArgs = {
        inherit
          self
          inputs
          outputs
          stateVersion
          username
          hostname
          desktop
          ;
    };
    modules = [
      inputs.catppuccin.nixosModules.catppuccin
      ../hosts/${hostname}
      ../users/${username}/nixos.nix
    ];
  };

  forAllSystems = inputs.nixpkgs.lib.genAttrs [
    "aarch64-linux"
    "x86_64-linux"
    "aarch64-darwin"
    "x86_64-darwin"
  ];
}
