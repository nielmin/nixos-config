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
        inputs.catppuccin.homeManagerModules.catppuccin
        ../users/${username}/home.nix
      ];
    };
}
