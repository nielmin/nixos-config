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
            theme = Black Metal (Bathory)

            font-family = Agave Nerd Font Regular
            font-family-bold = Agave Nerd Font Bold

            font-size = 16
          '';
        };
      };
    };
  };
}
