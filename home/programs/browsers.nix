{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        name = "default";
        isDefault = true;
        containers = {
          shopping = {
            color = "green";
            icon = "cart";
            id = 1;
          };
        };
      };
    };
    nativeMessagingHosts = [
      pkgs.keepassxc
    ];
  };
}
