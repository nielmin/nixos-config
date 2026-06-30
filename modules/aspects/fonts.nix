{nlm, ...}: {
  nlm.fonts = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        comfortaa

        noto-fonts-cjk-sans
        noto-fonts-cjk-serif

        agave
        nerd-fonts.agave
      ];
    };

    homeManager = {pkgs, ...}: {};
  };
}
