{nlm, __findFile, ...}: {
  nlm.kde-desktop = {
    includes = [
      <nlm/multimedia>
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
        kdePackages.kdenlive
        librewolf
        thunderbird
        openscad-unstable
        orca-slicer
      ];

      programs = {
        localsend.enable = true;
      };
    };
  };
}
