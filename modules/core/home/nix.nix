{
  flake.homeModules.nix = {
    nix.settings = {
      warn-dirty = false;
      experimental-features = "nix-command flakes";
    };
  };
}
