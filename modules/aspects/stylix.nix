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

      environment.systemPackages = with pkgs; [adwaita-icon-theme];

      stylix = {
        enable = true;

        base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Amber";
          size = 32;
        };

        fonts = {
          serif = {
            package = pkgs.dejavu_fonts;
            name = "Dejavu Serif";
          };
          sansSerif = {
            package = pkgs.dejavu_fonts;
            name = "Dejavu Sans";
          };
          monospace = {
            package = pkgs.dejavu_fonts;
            name = "Dejavu Sans Mono";
          };
        };
      };
    };

    homeManager = {pkgs, ...}: {
      imports = [
        inputs.stylix.homeModules.stylix
      ];
    };
  };
}
