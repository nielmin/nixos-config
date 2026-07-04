{
  nlm,
  __findFile,
  ...
}: {
  nlm.niri-desktop = {
    includes = [
      <nlm/browsers>
      <nlm/multimedia>
      <nlm/udev>
      <nlm/cifs>
      <nlm/fonts>
      <nlm/wezterm>
      <nlm/niri>
      <nlm/noctalia-shell>
    ];
    nixos = {pkgs, ...}: {
      services = {
        printing.enable = true;
        geoclue2.enable = true;

        power-profiles-daemon.enable = false;

        tlp = {
          enable = true;
          pd.enable = true;
        };
      };

      environment.systemPackages = with pkgs; [
        thunderbird
        supersonic
        fuzzel
      ];

      programs = {
        localsend = {
          enable = true;
          openFirewall = true;
        };
      };
    };
  };
}
