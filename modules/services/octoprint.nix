{
  flake.modules.nixos.octoprint = {
    services.octoprint = {
      enable = true;
      user = "daniel";
      group = "daniel";
      openFirewall = true;
    };
  };
}
