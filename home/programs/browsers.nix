{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [
      pkgs.keepassxc
    ];
    profiles.default.extensions.force = true;
  };
}
