{
  nlm,
  __findFile,
  ...
}: {
  nlm.dev = {
    includes = [
      <nlm/neovim>
    ];
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        ghostty

        nurl
        nix-init
      ];

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
          stdenv.cc.cc.lib # libstdc++.so.6 for most wheels
          zlib # CPython, many compiled extensions
          openssl
          libffi
          glibc
        ];
      };
    };

    hjem = {pkgs, ...}: {
      files = {
        ".config/ghostty/config.ghostty".source = pkgs.writeTextFile {
          name = "config.ghostty";
          text = ''
            theme = dark:koda-dark,light:koda-light

            font-family = Agave Nerd Font Regular
            font-family-bold = Agave Nerd Font Bold

            font-size = 16
          '';
        };

        ".config/ghostty/themes/koda-dark".source = pkgs.writeTextFile {
          name = "koda-dark";
          text = ''
            # Forces bold text to use the bright color palette
            bold-is-bright = true

            # Background and foreground
            background = #101010
            foreground = #ffffff

            # Cursor colors
            cursor-color = #b0b0b0
            cursor-text = #101010

            # Selection colors
            selection-background = #272727
            selection-foreground = #b0b0b0

            # ANSI color palette (0-15)
            palette = 0=#101010
            palette = 1=#ff7676
            palette = 2=#a3d6a3
            palette = 3=#ffffff
            palette = 4=#b3b3b3
            palette = 5=#f4b8e4
            palette = 6=#fafafa
            palette = 7=#a5adce
            palette = 8=#50585d
            palette = 9=#ff5733
            palette = 10=#86cd82
            palette = 11=#d9ba73
            palette = 12=#ffffff
            palette = 13=#f2a4db
            palette = 14=#5abfb5
            palette = 15=#b5bfe2
          '';
        };

        ".config/ghostty/themes/koda-light".source = pkgs.writeTextFile {
          name = "koda-light";
          text = ''
            # Forces bold text to use the bright color palette
            bold-is-bright = true

            # Background and foreground
            background = #faf9f5
            foreground = #101010

            # Cursor colors
            cursor-color = #6a6a6a
            cursor-text = #ebebeb

            # Selection colors
            selection-background = #ebebeb
            selection-foreground = #101010

            # ANSI color palette (0-15)
            palette = 0=#ebebeb
            palette = 1=#ca0043
            palette = 2=#407f00
            palette = 3=#926200
            palette = 4=#3d3d3d
            palette = 5=#a200d1
            palette = 6=#007d7d
            palette = 7=#6a6a6a
            palette = 8=#969ba5
            palette = 9=#f30052
            palette = 10=#4f9a00
            palette = 11=#b07700
            palette = 12=#000000
            palette = 13=#c301fb
            palette = 14=#009797
            palette = 15=#101010
          '';
        };
      };
    };
  };
}
