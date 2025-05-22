{ pkgs, ... }:

{
  services.podman = {
    enable = true;
    enableTypeChecks = true;
    autoUpdate = true;
  };
}
