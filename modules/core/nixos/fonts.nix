{
  flake.modules.nixos.core =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji

        inter

        nerd-fonts.fira-code
        nerd-fonts.jetbrains-mono
        nerd-fonts._0xproto

        atkinson-hyperlegible-next
        atkinson-hyperlegible-mono

        _0xproto

        font-awesome
      ];
    };
}
