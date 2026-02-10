{
  flake.modules.nixos.virtualisation = {
    virtualisation = {
      libvirtd.enable = true;
      containers.enable = true;
      podman = {
        enable = true;
        dockerCompat = true;
      };
    };
  };
}
