{
  flake-file.inputs = {
    nixpkgs.url = "https://nixos.org/channels/nixos-unstable/nixexprs.tar.zst";
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";
  nix = {
    optimise.automatic = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      use-xdg-base-directories = true;
      auto-optimise-store = true;
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
    home-manager = {
      backupFileExtension = "bak";
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}
