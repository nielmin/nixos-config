{
  environment.persistence."/persist" = let
    user = "daniel";
  in {
    hideMounts = true;
    directories = [
      "/etc/NetworkManager/system-connections"
      "/tmp"
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
    ];

    files = [
      "/etc/machine-id"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
    users.${user} = {
      directories = [
        "Downloads"
        "Documents"
        "Music"
        "Pictures"
        "Videos"
        {
          directory = ".ssh";
          mode = "0700";
        }
        "tmp"
        ".config"
        ".mozilla"
        ".local/share/direnv"
        ".steam"
        ".thunderbird"
      ];
    };
  };
}
