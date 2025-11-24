{
  flake.modules.homeManager.jellyfin = {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };
}
