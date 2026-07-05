{
  nlm,
  __findFile,
  ...
}: {
  nlm.kde-desktop = {
    includes = [
      <nlm/browsers>
      <nlm/graphics>
      <nlm/fonts>
      <nlm/udev>
      <nlm/multimedia>
      <nlm/wezterm>
      <nlm/cifs>
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
        kid3
        thunderbird
        supersonic
      ];

      programs = {
        localsend = {
          enable = true;
          openFirewall = true;
        };
      };
    };
  };
}
