{
  flake.modules.nixos.core = {
    services.openssh = {
      enable = true;

      settings.PasswordAuthentication = true;
    };
  };
}
