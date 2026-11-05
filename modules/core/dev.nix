{
  inputs,
  ...
}:
{
  flake.modules.nixos.dev = { pkgs, ... }: {
    imports = [
      inputs.self.modules.nixos.ghostty
      inputs.self.modules.nixos.neovim
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
  flake.modules.homeManager.dev = { pkgs, ... }: {
    imports = [
      inputs.self.modules.homeManager.fish
    ];
  };
}
