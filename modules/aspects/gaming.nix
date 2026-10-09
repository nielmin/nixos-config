{
  flake.modules.nixos.gaming = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      # heroic

      steam-devices-udev-rules
    ];
    programs.steam = {
      enable = true;
    };
  };

  flake.modules.homeManager.gaming = { };
}
