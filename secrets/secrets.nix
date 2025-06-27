  let
    # Users
    daniel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHKmr//V3GIOxwtWLy/KU8Qnj7BaGqtUJratYpKqkWvy daniel@asta";
    users = [ daniel ];

    # Hosts
    asta = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGQWWo40J1Sab/qD0MEJUhFRM6mJ1Ca9sM9vUxsBhdtv root@asta";
    systems = [ asta ];
  in
  {
    "userpass.age".publicKeys = [ daniel asta ];
    "wifi-passwd.age".publicKeys = users ++ systems;
  }
