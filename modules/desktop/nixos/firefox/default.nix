{
  flake.modules.nixos.desktop.firefox =
    # { pkgs, ... }:

  {
    programs.firefox = {
      enable = true;
    };
  };
}
