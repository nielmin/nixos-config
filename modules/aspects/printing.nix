{
  nlm,
  ...
}: {
  nlm.printing = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        nssmdns
      ];
      services = {
        avahi = {
          enable = true;
          openFirewall = true;
          nssmdns4 = true;
        };
        printing = {
          enable = true;
        };
      };
    };
  };
}
