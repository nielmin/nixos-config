{
  inputs,
  ...
}:
{
  flake.modules.nixos.kde-desktop = { pkgs, ... }: {
    includes = [
      inputs.self.nixos.browsers
      inputs.self.nixos.fonts
      inputs.self.nixos.udev
      inputs.self.nixos.pipewire
      inputs.self.nixos.multimedia
      inputs.self.nixos.power-mgmt
      inputs.self.nixos.services
      inputs.self.nixos.smb
      inputs.self.nixos.utils
    ];
    services = {
      displayManager.plasma-login-manager.enable = true;
      desktopManager.plasma6.enable = true;

      geoclue2.enable = true;
    };

    environment.plasma6.excludePackages = with pkgs; [
      kdePackages.discover
      kdePackages.elisa
      kdePackages.gwenview
      kdePackages.khelpcenter
      kdePackages.konsole
      kdePackages.qrca
    ];

    environment.systemPackages = with pkgs; [
      kdePackages.kdenlive
      kdePackages.koko
      kid3
      thunderbird
      supersonic
    ];

    programs.kde-pim.enable = false;

    programs = {
      localsend = {
        enable = true;
        openFirewall = true;
      };
    };
  };
}
