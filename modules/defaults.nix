{
  den.default = {
    nixos = {
      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "26.05";
      nix = {
        optimise.automatic = true;
        gc = {
          automatic = true;
          options = "--delete-older-than 7d";
        };
        settings = {
          experimental-features = ["nix-command" "flakes"];
          use-xdg-base-directories = true;
          auto-optimise-store = true;
          trusted-users = [
            "root"
            "@wheel"
          ];
        };
      };

      services = {
        openssh.enable = true;
        fwupd.enable = true;
      };

      networking = {
        networkmanager.enable = true;
      };

      time.timeZone = "America/Chicago";
      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
          LC_ADDRESS = "en_US.UTF-8";
          LC_IDENTIFICATION = "en_US.UTF-8";
          LC_MEASUREMENT = "en_US.UTF-8";
          LC_MONETARY = "en_US.UTF-8";
          LC_NAME = "en_US.UTF-8";
          LC_NUMERIC = "en_US.UTF-8";
          LC_PAPER = "en_US.UTF-8";
          LC_TELEPHONE = "en_US.UTF-8";
          LC_TIME = "en_US.UTF-8";
        };
      };
    };
    homeManager = {
      home.stateVersion = "26.05";
      programs.home-manager.enable = true;
    };
  };
}
