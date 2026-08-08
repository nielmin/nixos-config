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

        # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

        polarity = "dark";
        base16Scheme = {
          base00 = "101010"; # Default Background
          base01 = "272727"; # Lighter Background (Selection Background)
          base02 = "383838"; # Selection Highlight
          base03 = "50585d"; # Comments, Invisibles, Dimmed Text (Palette 8)
          base04 = "a5adce"; # Dark Foreground / Status Bar Text (Palette 7)
          base05 = "ffffff"; # Default Foreground / Caret
          base06 = "fafafa"; # Light Foreground (Palette 6)
          base07 = "b5bfe2"; # Light Background / Bright White (Palette 15)
          base08 = "ff7676"; # Red / Variables (Palette 1)
          base09 = "ff5733"; # Orange / Integers, Constants (Palette 9)
          base0A = "d9ba73"; # Yellow / Classes, Types (Palette 11)
          base0B = "a3d6a3"; # Green / Strings (Palette 2)
          base0C = "5abfb5"; # Cyan / Support, Regex (Palette 14)
          base0D = "b3b3b3"; # Blue / Functions, Methods (Palette 4)
          base0E = "f4b8e4"; # Magenta / Keywords (Palette 5)
          base0F = "f2a4db"; # Pink / Extra Accent (Palette 13)
        };

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
      stylix.targets = {
        blender.enable = false;
        firefox = {
          enable = true;
          profileNames = ["my-profile"];
        };
      };
    };
  };
}
