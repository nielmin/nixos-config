{
  den.default = {
    nixos = {
      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "25.11";
      nix = {
        optimise.automatic = true;
	gc = {
	  automatic = true;
	  options = "--delete-older-than 7d";
	};
        settings = {
	  experimental-features = [ "nix-command" "flakes" ];
	  use-xdg-base-directories = true;
	  auto-optimise-store = true;
	  trusted-users = [
            "root"
	    "@wheel"
	  ];
	};
      };
      home-manager.backupFileExtension = "bak";
    };
    homeManager.home.stateVersion = "25.11";
  };
}
