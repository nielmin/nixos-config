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

        _7zz
        unrar
        unzip

        wl-clipboard

        usbutils

        v4l-utils
      ];
    };
  };
}
