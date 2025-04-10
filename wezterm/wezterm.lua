local wezterm = require 'wezterm'
local act = wezterm.action

return {
  -- General configuration
  color_scheme = "Apple System Colors",  -- Popular color scheme
  font = wezterm.font_with_fallback({
    "ZedMono nerd font",  -- Primary font
    "Noto Color Emoji",    -- Fallback for emojis
  }),
  font_size = 11.0,
  line_height = 1.3,
  default_cursor_style = "BlinkingBar",
  animation_fps = 60,
  enable_scroll_bar = true,
  scrollback_lines = 10000,
  warn_about_missing_glyphs = false,
  window_background_opacity = 0.7,

  -- Window configuration
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_decorations = "RESIZE",
  window_close_confirmation = "AlwaysPrompt",
  initial_cols = 100,
  initial_rows = 30,
  adjust_window_size_when_changing_font_size = false,
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = true,
  show_new_tab_button_in_tab_bar = false,

  -- Key bindings

  keys = {
    -- Copy/Paste
    { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
    { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
    
    -- Tab management
    { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab { confirm = true } },
    { key = 'k', mods = 'ALT', action = act.ActivateTabRelative(1) },
    { key = 'j', mods = 'ALT', action = act.ActivateTabRelative(-1) },
    
    -- Pane management
    { key = '%', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = '&', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down' },
    
    -- Font size
    { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
    { key = '0', mods = 'CTRL', action = act.ResetFontSize },
  },

  -- Appearance tweaks
  colors = {
    tab_bar = {
      background = '#1C2021',
      active_tab = {
        bg_color= '#1C2021',
        fg_color = '#cdd6f4',
      },
      inactive_tab = {
        bg_color = '#181825',
        fg_color = '#6c7086',
      },
      inactive_tab_hover = {
        bg_color = '#313244',
        fg_color = '#cdd6f4',
      },
      new_tab = {
        bg_color = '#181825',
        fg_color = '#6c7086',
      },
      new_tab_hover = {
        bg_color = '#313244',
        fg_color = '#cdd6f4',
        italic = true,
      },
    },
  },

  -- Launch programs in specific tabs
  launch_menu = {
    {
      args = { 'top' },
    },
    {
      label = 'Bash',
      args = { 'bash', '-l' },
    },
    {
      label = 'Python',
      args = { 'python' },
    },
  },
}
