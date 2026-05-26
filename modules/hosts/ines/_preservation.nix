{
  preservation = {
    enable = true;

    preserveAt."/persist" = {
      directories = [
        "/etc/nixos"
        "/var/lib/bluetooth"
        "/var/lib/nixos"
        "/var/log"
        "/var/lib/systemd/timers"
        "/etc/NetworkManager/system-connections"
        "/tmp"
        {
          directory = "/var/lib/nixos";
          inInitrd = true;
        }
      ];

      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
      ];

      # Preserve user files
      users.daniel = {
        directories = [
          ".ssh"
          ".mozilla"
          "nixos-config"
        ];
      #
      #   files = [
      #
      #   ];
      };
    };
  };
}
