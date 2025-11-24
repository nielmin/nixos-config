{ config, ... }:
{
  flake.modules.nixos.radicale = {
    services.radicale = {
      enable = true;
      openFirewall = true;
    };
  };
}
