{nlm, ...}: {
  nlm.cli = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        curl
        git
        wget
        neovim

        cryptsetup
        fzf

        rbw
        pinentry-qt

        unzip

        wl-clipboard

        usbutils
      ];
    };

    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        bottom
      ];
    };
  };
}
