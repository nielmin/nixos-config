{
  nlm,
  __findFile,
  ...
}: {
  nlm.niri-desktop = {
    includes = [
      <nlm/browsers>
      <nlm/graphics>
      <nlm/udev>
      <nlm/multimedia>
      <nlm/wezterm>
      <nlm/cifs>
    ];
    nixos = {pkgs, ...}: {
      services = {
        displayManager.plasma-login-manager.enable = true;

        printing.enable = true;
        geoclue2.enable = true;

        tlp = {
          enable = true;
          pd.enable = true;
        };
      };

      environment.systemPackages = with pkgs; [
        kdePackages.kdenlive
        kid3
        thunderbird
        supersonic
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
