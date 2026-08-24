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
      <nlm/pipewire>
      <nlm/multimedia>
      <nlm/power-mgmt>
      <nlm/services>
      <nlm/smb>
    ];
    nixos = {pkgs, ...}: {
      services = {
        displayManager.plasma-login-manager.enable = true;
        desktopManager.plasma6.enable = true;

        geoclue2.enable = true;
      };

      environment.plasma6.excludePackages = with pkgs; [
        kdePackages.discover
        kdePackages.elisa
        kdePackages.kate
        kdePackages.khelpcenter
        kdePackages.konsole
        kdePackages.qrca
      ];

      environment.systemPackages = with pkgs; [
        kdePackages.kdenlive
        kid3
        thunderbird
        supersonic
      ];
    };
  };
}
