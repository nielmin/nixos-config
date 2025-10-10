{
  flake.modules = {
    nixos.undervolt = {
      services.undervolt = {
        enable = true;
        coreOffset = -90;
      };
    };
    homeManager.undervolt =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          undervolt
          s-tui
          stress
        ];
      };
  };
}
