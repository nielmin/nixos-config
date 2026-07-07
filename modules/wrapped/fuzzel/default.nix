{
  nlm,
  inputs,
  ...
}: {
  nlm.niri = {
    nixos = {
      pkgs,
      ...
    }: {
      imports = [
        inputs.nix-wrapper-modules.nixosModules.fuzzel
      ];

      wrappers.fuzzel = {
        enable = true;
        settings = {
          main = {
            font = "Agave Nerd Font:weight=bold:size=10";
            dpi-aware = "no";
            terminal = "wezterm";
            prompt = ">";
            icon-theme = "Adwaita";
            width = 35;
            horizontal-pad = 10;
            inner-pad = 5;
            line-height = 20;
            lines = 8;
            letter-spacing = 0;
            anchor = "center";
            layer = "overlay";
            exit-on-keyboard-focuf-loss = "yes";
          };

        };
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
