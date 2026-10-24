{
  nlm.cli = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        curl
        dig
        git
        wget

        bottom
        dua
        jq
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
        util-linux
        pciutils
        v4l-utils

        zigfetch
      ];
    };
  };
}
