{ config, ... }:
{
  flake.modules.nixos.jellyfin = {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
      user = config.flake.meta.users.daniel.username;
    };
  };
}
