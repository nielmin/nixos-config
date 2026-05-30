{inputs, lib, ...}: {
  nlm.wezterm = {
    nixos = {pkgs, wrappers, ...}:
    let
      wrappedWezterm = inputs.wrappers.wrappers.wezterm.wrap {
        inherit pkgs;

        luaInfo = {
          keys = [
          {
            key = "w";
            mods = "CTRL|SHIFT";
            action = lib.generators.mkLuaInline "wezterm.action.CloseCurrentPane({ confirm = false })";
          }
          {
            key = "|";
            mods = "SUPER|SHIFT";
            action = lib.generators.mkLuaInline "wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' })";
          }
          {
            key = "-";
            mods = "SUPER";
            action = lib.generators.mkLuaInline "wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' })";
          }
          ];
        };
      };
    in {
      environment.systemPackages = [
        wrappedWezterm
      ];
    };
  };
}
