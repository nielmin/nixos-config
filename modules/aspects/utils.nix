{
  flake.modules.nixos.utils = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      rbw
      pinentry-qt

      scrcpy
    ];
  };
}
