{ inputs, nlm, ... }:
{
  flake-file.inputs.sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  nlm.sops = { pkgs, ... }:
  {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];
  };
}
