-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Color scheme
config.color_scheme = 'koda'

config.color_schemes = {
  ['koda'] = {
    foreground = "#ffffff",
    background = "#101010",

    cursor_bg = "#b0b0b0",
    cursor_fg = "#101010",
    cursor_border = "#b0b0b0",

    selection_bg = "#272727",
    selection_fg = "#b0b0b0",

    split = "#ffffff",
    compose_cursor = "#d9ba73",
    scrollbar_thumb = "#b0b0b0",

    ansi = {
      "#101010",
      "#ff7676",
      "#a3d6a3",
      "#ffffff",
      "#b3b3b3",
      "#f4b8e4",
      "#fafafa",
      "#a5adce",
    },

    brights = {
      "#50585d",
      "#ff5733",
      "#86cd82",
      "#d9ba73",
      "#ffffff",
      "#f2a4db",
      "#5abfb5",
      "#b5bfe2",
    },

    tab_bar = {
      inactive_tab_edge = "#272727",
      background = "#272727",

      active_tab = {
        fg_color = "#ffffff",
        bg_color = "#101010",
      },

      inactive_tab = {
        fg_color = "#777777",
        bg_color = "#272727",
      },

      inactive_tab_hover = {
        fg_color = "#000000",
        bg_color = "#ebebeb",
      },

      new_tab = {
        fg_color = "#b0b0b0",
        bg_color = "#272727",
      },

      new_tab_hover = {
        fg_color = "#000000",
        bg_color = "#ebebeb",
        intensity = "Bold",
      },
    },
  }
}

-- This is where you actually apply your config choices.

config.enable_tab_bar = false

-- For example, changing the initial geometry for new windows:
config.initial_cols = 80
config.initial_rows = 36

-- or, changing the font size and color scheme.
config.font_size = 18
config.font = wezterm.font("Agave")
config.colors = theme

config.keys = {
  {
    key = "w",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CloseCurrentPane({ confirm = false }),
  },
  {
    key = "|",
    mods = "SUPER|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "-",
    mods = "SUPER",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
}

-- Finally, return the configuration to wezterm:
return config
