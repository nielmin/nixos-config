{
  inputs,
  nlm,
  ...
}: {
  nlm.stylix = {
    nixos = {
      config,
      pkgs,
      lib,
      ...
    }: {
      imports = [
        inputs.stylix.nixosModules.stylix
      ];

      stylix.enable = true;
    };

    homeManager = {pkgs, ...}: {
      imports = [
        inputs.stylix.homeModules.stylix
      ];
    };
  };
}
