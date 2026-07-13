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

    homeManager = {pkgs, ...}: {};
  };
}
