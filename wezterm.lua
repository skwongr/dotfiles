-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
-- config.initial_cols = 120
-- config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 18
config.adjust_window_size_when_changing_font_size = false
config.enable_kitty_keyboard = true
config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 999999
config.window_close_confirmation = 'NeverPrompt'

wezterm.on('mux-is-process-stateful', function(_proc)
  return false
end)

config.keys = {
  { key = 'Enter', mods = 'SHIFT', action = wezterm.action.SendString '\n' },
}

-- Finally, return the configuration to wezterm:
return config
