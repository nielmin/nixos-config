{nlm, ...}: {
  nlm.fonts = {
    nixos = {pkgs, ...}: {
      fonts.packages = with pkgs; [
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif

        agave
        nerd-fonts.agave
      ];
    };

    homeManager = {pkgs, ...}: {};
  };
}
