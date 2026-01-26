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
        glance
        gonic
        kavita
        jellyfin
        miniflux
        pdfding
        radicale
        readeck
      ];
    };

    homeManager.homelab = {
      imports = with config.flake.modules.homeManager; [
        quadlet
        glance
        gonic
        kavita
        jellyfin
        miniflux
        pdfding
        radicale
        readeck
      ];
    };
  };
}
