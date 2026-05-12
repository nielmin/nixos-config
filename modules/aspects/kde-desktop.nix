{den, ...}: {
  den.aspects.kde-desktop = {
    nixos = {pkgs, ...}: {
      services = {
        displayManager.plasma-login-manager.enable = true;
        desktopManager.plasma6.enable = true;

        printing.enable = true;
        geoclue2.enable = true;

	power-profiles-daemon.enable = true;
      };

      programs.librewolf.enable = true;

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
