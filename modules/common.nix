{ config, lib, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    neovim 
    helix
    git
    curl
    wget
  ];
}
