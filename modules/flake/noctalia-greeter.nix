{
  inputs,
  nlm,
  ...
}: {
  flake-file.inputs.noctalia-greeter = {
    url = "github:noctalia-dev/noctalia-greeter";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  nlm.noctalia-greeter = {
    nixos = {pkgs, ...}: {
      imports = [
        inputs.noctalia-greeter.nixosModules.default
      ];

      programs.noctalia-greeter = {
        enable = true;
      };

    };
  };
}
