{
  inputs,
  config,
  ...
}:
{
  flake.modules = {
    nixos.homelab = {
      systemd.tmpfiles.rules = [
        "d /home/daniel/containers 0755 daniel daniel - -"
      ];
      imports = with config.flake.modules.nixos; [
        quadlet
        gonic
        kavita
        jellyfin
        miniflux
        radicale
      ];
    };

    homeManager.homelab = {
      imports = with config.flake.modules.homeManager; [
        quadlet
        gonic
        kavita
        jellyfin
        miniflux
        radicale
      ];
    };
  };
}
