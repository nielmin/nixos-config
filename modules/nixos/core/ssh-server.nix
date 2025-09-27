{
  flake.modules.nixos.ssh-server = {
    services.openssh = {
      enable = true;

      settings.PasswordAuthentication = false;
    };
  };
}
