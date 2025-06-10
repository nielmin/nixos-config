{ pkgs, lib, username, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji

    inter
    
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

}
