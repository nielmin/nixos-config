{nlm, ...}: {
  nlm.cli = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        curl
        git
        wget

        bottom
        dua
        kbt
        ripgrep
        tree

        cryptsetup
        fzf

        _7zz
        unrar
        unzip

        wl-clipboard

        usbutils
        pciutils
        v4l-utils
      ];
    };
  };
}
