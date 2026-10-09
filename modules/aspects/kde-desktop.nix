{ inputs, ... }: {
  flake.modules.nixos.kde-desktop = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      browsers
      graphics
      fonts
      udev
      pipewire
      multimedia
      power-mgmt
      services
      smb
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
      kdePackages.kate
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
