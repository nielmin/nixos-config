{
  flake.nixosModules.vm = {
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
