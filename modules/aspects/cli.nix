{nlm, ...}: {
  nlm.cli = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        curl
        git
        wget
        neovim
        ripgrep

        cryptsetup
        fzf

        rbw
        pinentry-qt

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
