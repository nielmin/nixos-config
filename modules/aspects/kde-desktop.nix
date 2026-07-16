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
      <nlm/wezterm>
      <nlm/cifs>
      <nlm/power-mgmt>
      <nlm/services>
    ];
    nixos = {pkgs, ...}: {
      services = {
        displayManager.plasma-login-manager.enable = true;
        desktopManager.plasma6.enable = true;

        geoclue2.enable = true;
      };

      environment.systemPackages = with pkgs; [
        kdePackages.kdenlive
        kid3
        thunderbird
        supersonic
      ];
    };
  };
}
