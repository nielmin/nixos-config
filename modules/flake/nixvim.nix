{
  flake-file.inputs.nixvim = {
    url = "github:nix-community/nixvim";
    # If you are not running an unstable channel of nixpkgs, select the corresponding branch of Nixvim.
    # url = "github:nix-community/nixvim/nixos-25.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
