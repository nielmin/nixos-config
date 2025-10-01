{
  flake.modules.nixos.desktop =
    # { pkgs, ... }:

  {
    programs.firefox = {
      enable = true;
    };
  };
}
