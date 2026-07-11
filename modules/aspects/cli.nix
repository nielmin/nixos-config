{nlm, ...}: {
  nlm.cli = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        curl
        dua
        git
        wget
        ripgrep
        bottom
        pciutils

        cryptsetup
        fzf

        rbw
        pinentry-qt

        _7zz
        unrar
        unzip

        wl-clipboard

        usbutils

        scrcpy
        android-tools
        v4l-utils
      ];
    };
  };
}
