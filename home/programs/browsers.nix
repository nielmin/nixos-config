{ pkgs, config, username, ... }:

{
  # Install firefox.
  programs = {
    firefox = {
      enable = true;
    };
  };
}
