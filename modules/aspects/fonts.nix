{nlm, ...}: {
  nlm.fonts = {
    nixos = {pkgs, ...}: {
      fonts.packages = with pkgs; [
        agave
        nerd-fonts.agave

        atkinson-hyperlegible-next
        atkinson-hyperlegible-mono

        inter

        noto-fonts-cjk-sans
        noto-fonts-cjk-serif

      ];
    };

    homeManager = {pkgs, ...}: {};
  };
}
