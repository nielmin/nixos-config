{nlm, ...}: {
  nlm.utils = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        rbw
        pinentry-qt

        scrcpy
      ];
    };
  };
}
