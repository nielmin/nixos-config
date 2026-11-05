{
  inputs,
  ...
}:
{
  flake.modules.nixos.kde-desktop = { pkgs, ... }: {
    imports = [
      inputs.self.modules.nixos.browsers
      inputs.self.modules.nixos.fonts
      inputs.self.modules.nixos.udev
      inputs.self.modules.nixos.pipewire
      inputs.self.modules.nixos.multimedia
      inputs.self.modules.nixos.power-mgmt
      inputs.self.modules.nixos.services
      inputs.self.modules.nixos.smb
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
