{
  nlm,
  inputs,
  ...
}: {
  nlm.noctalia-shell = {
    nixos = {
      pkgs,
      lib,
      config,
      ...
    }: {
      imports = [
        inputs.noctalia.nixosModules.default
        inputs.nix-wrapper-modules.nixosModules.noctalia-shell
      ];

      wrappers.noctalia-shell = {
        enable = true;
        package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;

        colors = {
          type = "json";
          value = builtins.fromJSON (builtins.readFile ./colors.json);
        };

        settings = {
          type = "json";
          value = builtins.fromJSON (builtins.readFile ./settings.json);
        };
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
