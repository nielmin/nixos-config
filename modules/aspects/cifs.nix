{nlm, ...}: {
  nlm.cifs = {
    nixos = {
      config,
      pkgs,
      ...
    }: {
      fileSystems."/mnt/kai" = {
        device = "//192.168.1.101/kai";
        fsType = "cifs";
        options = [
          "credentials=${config.sops.secrets.samba.path}"

          "x-systemd.automount"
          "x-systemd.idle-timeout=60"
          "x-systemd.device-timeout=5s"
          "x-systemd.mount-timeout=5s"

          "noauto"
          "uid=1000"
          "gid=1000"
          "file_mode=0770"
          "dir_mode=0770"
        ];
      };
    };
  };
}
