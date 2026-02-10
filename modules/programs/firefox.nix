{
  flake.modules.nixos.firefox =
    { pkgs, ... }:
    {
      programs.firefox = {
        enable = true;
      };

      environment.systemPackages = with pkgs; [
        librewolf
      ];
    };
}
