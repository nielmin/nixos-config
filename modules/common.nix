{ config, lib, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    neovim 
    git
    curl
    wget
  ];
}
