{den, ...}: {
  den.aspects.cli = {
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
      ];
    };

    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        bottom
        neovim
      ];
    };
  };
}
