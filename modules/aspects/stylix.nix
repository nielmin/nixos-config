{
  inputs,
  nlm,
  ...
}: {
  nlm.stylix = {
    nixos = {pkgs, ...}: {
      imports = [
        inputs.stylix.nixosModules.stylix
      ];

      stylix = {
        enable = true;

        base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Amber";
          size = 32;
        };

        targets = {
          gnome.enable = false;
        };
      };
    };

    homeManager = {pkgs, ...}: {
      imports = [
        inputs.stylix.homeModules.stylix
      ];

      stylix = {
        gnome.enable = false;
      };
    };
  };
}
