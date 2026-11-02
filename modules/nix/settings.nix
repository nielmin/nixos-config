{
  inputs,
  ...
}:
{

  flake.modules.nixos.settings =
    {
      config,
      lib,
      pkgs,
      ...

    }:
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
        inputs.sops-nix.nixosModules.sops
        inputs.disko.nixosModules.disko
      ];

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
      };

      home-manager = {
        verbose = true;
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "backup";
        backupCommand = "rm";
        overwriteBackup = true;

        home.stateVersion = "26.05";
      };

      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "26.05";
    };
}
