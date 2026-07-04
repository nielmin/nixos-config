{nlm, ...}: {
  nlm.cli = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        curl
        dua
        git
        wget
        ripgrep

        cryptsetup
        fzf

        rbw
        pinentry-qt

        unrar
        unzip

        wl-clipboard

        usbutils

        scrcpy
        android-tools
        v4l-utils
      ];
    };

    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        bottom
      ];
    };
  };
}
