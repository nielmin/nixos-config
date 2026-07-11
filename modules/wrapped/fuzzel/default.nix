{
  nlm,
  inputs,
  ...
}: {
  nlm.niri = {
    nixos = {pkgs, ...}: {
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
            prompt = "❯ ";
            icon-theme = "Adwaita";
            width = 35;
            horizontal-pad = 10;
            inner-pad = 5;
            line-height = 20;
            lines = 8;
            letter-spacing = 0;
            anchor = "center";
            layer = "overlay";
            exit-on-keyboard-focus-loss = "yes";
          };
          colors = {
            background = "0a0a0fe6";
            text = "f8f8f2ff";
            match = "8be9fdff";
            selection = "8be9fdff";
            selection-text = "0a0a0fff";
            selection-match = "0a0a0fff";
          };
          dmenu = {
            mode = "text";
            exit-immediately-if-empty = "no";
          };
        };
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
