{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji

        inter

        nerd-fonts.fira-code
        nerd-fonts.jetbrains-mono

        atkinson-hyperlegible-next
        atkinson-hyperlegible-mono
      ];
    };
}
