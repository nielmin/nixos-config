{
  nlm,
  __findFile,
  ...
}: {
  nlm.kde-desktop = {
    includes = [
      <nlm/udev>
      <nlm/multimedia>
      <nlm/wezterm>
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
        chromium
        kdePackages.kdenlive
        kid3
        librewolf
        nssmdns
        thunderbird
        openscad-unstable
        orca-slicer
        supersonic
      ];

      programs.chromium = {
        enable = true;
        extensions = [
          "cjpalhdlnbpafiamejdnhcphjbkeiagm"
        ];
      };

      programs = {
        localsend.enable = true;
      };
    };
  };
}
