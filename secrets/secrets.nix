let
  asta = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHKmr//V3GIOxwtWLy/KU8Qnj7BaGqtUJratYpKqkWvy daniel@asta";
  ines = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr1KZ+SFRgEcIwCLWMp4bUnyJYtEgUSsR9nBHWR6/Vh daniel@ines";

  users = [ asta ines ];
in
{
  "vm_pass.age".publicKeys = users;
}
