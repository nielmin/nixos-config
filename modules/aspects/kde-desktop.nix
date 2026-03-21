{ den, ... }: {
  den.aspects.kde-desktop = {
    nixos = { pkgs, ... }: {
      services = {
      	displayManager.sddm.enable = true;
	desktopManager.plasma6.enable = true;

	printing.enable = true;
      };

      programs.firefox.enable = true;

      environment.systemPackages = with pkgs; [
        bottom
	curl
	git
	neovim
	wezterm
	wget
      ];
    };
  };
}
