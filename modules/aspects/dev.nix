{
  inputs,
  ...
}:
{
  flake.modules.nixos.dev = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      fish
      ghostty
      neovim
      # inputs.nix-wrapper-modules.nixosModules.neovim
    ];

    environment.systemPackages = with pkgs; [
      alejandra

      hydra-check

      nixd
      nix-init
      nurl
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

    programs.nh = {
      enable = true;
      flake = "/home/daniel/nixos-config";
    };
  };
}
