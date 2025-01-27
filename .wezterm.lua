-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices


-- Spawn a git-bash shell in login mode
config.default_prog = { 'C:/Program Files/Git/bin/bash.exe', '-l' }

config.default_cwd = "C:/code/"

config.color_scheme = 'SpaceGray Eighties'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 12

-- Creates a default window but makes it maximize on startup
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- config.window_close_confirmation = 'NeverPrompt'

-- config.keys = {
--   {
--     key = 'w',
--     mods = 'CTRL',
--     action = wezterm.action.CloseCurrentTab { confirm = true },
--   },
--   {
--     key = 't',
--     mods = 'CTRL',
--     action = wezterm.action.SpawnTab 'CurrentPaneDomain',
--   },
-- }

-- and finally, return the configuration to wezterm
return config