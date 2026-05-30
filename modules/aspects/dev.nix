{nlm, __findFile, ...}: {
  nlm.dev = {
    includes = [
      <nlm/fonts>
    ];
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [];

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };

    homeManager = {pkgs, ...}: {
      programs.wezterm = {
        enable = false;
        colorSchemes = {
          koda = {
            foreground = "#ffffff";
            background = "#101010";

            cursor_bg = "#b0b0b0";
            cursor_fg = "#101010";
            cursor_border = "#b0b0b0";

            selection_bg = "#272727";
            selection_fg = "#b0b0b0";

            split = "#ffffff";
            compose_cursor = "#d9ba73";
            scrollbar_thumb = "#b0b0b0";

            ansi = [
              "#101010"
              "#ff7676"
              "#a3d6a3"
              "#ffffff"
              "#b3b3b3"
              "#f4b8e4"
              "#fafafa"
              "#a5adce"
            ];

            brights = [
              "#50585d"
              "#ff5733"
              "#86cd82"
              "#d9ba73"
              "#ffffff"
              "#f2a4db"
              "#5abfb5"
              "#b5bfe2"
            ];
          };
        };
        extraConfig = "
        -- Pull in the wezterm API
        local wezterm = require(\"wezterm\")
        -- This will hold the configuration.
        local config = wezterm.config_builder()
        -- This is where you actually apply your config choices.
        -- For example, changing the initial geometry for new windows:
        config.initial_cols = 80
        config.initial_rows = 36
        -- or, changing the font size and color scheme.
        config.color_scheme = 'koda'
        -- Finally, return the configuration to wezterm:
        return config";
      };
    };
  };
}
