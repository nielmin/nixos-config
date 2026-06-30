{ inputs, nlm, ... }:
{
  flake-file.inputs.sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  nlm.sops = {
    nixos = { pkgs, ... }: {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];

      environment.systemPackages = with pkgs; [
        sops
        age
      ];
    };
  };
}
