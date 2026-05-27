{den, ...}: {
  den.aspects.kde-desktop = {
    includes = [
      den.aspects.multimedia
    ];
    nixos = {pkgs, ...}: {
      services = {
        displayManager.plasma-login-manager.enable = true;
        desktopManager.plasma6.enable = true;

        printing.enable = true;
        geoclue2.enable = true;

        power-profiles-daemon.enable = false;

        tlp = {
	  enable = true;
          pd.enable = true;
	};
      };

      environment.systemPackages = with pkgs; [
	librewolf
        wezterm
      ];

      programs = {
        localsend.enable = true;
      };
    };
  };
}
