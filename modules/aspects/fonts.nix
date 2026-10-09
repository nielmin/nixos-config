{
  flake.modules.nixos.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      agave
      nerd-fonts.agave

      atkinson-hyperlegible-next
      atkinson-hyperlegible-mono

      inter

      ioskeley-mono.nl-nf

      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
    ];
  };

  flake.modules.homeManager.fonts = { };
}
