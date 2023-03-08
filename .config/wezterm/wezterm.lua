local wezterm = require 'wezterm';

local tab_fg  = '#6e6a86'
local tab_bg  = '#191724'

local default = {
  foreground      = "white",    -- [silver] The default text color
  background      = "black",    -- [black]  The default background color
  cursor_bg       = "white",    -- [#52ad70] Overrides the cell background color when the current cell is occupied by the cursor and the cursor style is set to Block
  cursor_fg       = "black",    -- [black]   Overrides the text color when the current cell is occupied by the cursor
  cursor_border   = "white",    -- [#52ad70] Specifies the border color of the cursor when the cursor style is set to Block, of the color of the vertical or horizontal bar when the cursor style is set to Bar or Underline.
  selection_fg    = "black",    -- [black]   The foreground color of selected text
  selection_bg    = "#d0d0d0",  -- [#fffacd] The background color of selected text
  scrollbar_thumb = "#222222",  -- [#222222] The color of the scrollbar "thumb"; the portion that represents the current viewport
  split           = "#444444",  -- [#444444] The color of the split lines between panes
  ansi            = {'#000000', '#c75646', '#8eb33b', '#d0b03c', '#72b3cc', '#c8a0d1', '#218693', '#d0d0d0'}, --{"black", "maroon", "green", "olive",  "navy", "purple",  "teal", "silver"},
  brights         = {'#5d5d5d', '#e09690', '#cdee69', '#ffe377', '#9cd9f0', '#fbb1f9', '#77dfd8', '#f7f7f7'}, --{"grey",  "red",    "lime",  "yellow", "blue", "fuchsia", "aqua", "white"},
  -- indexed      = {[136]="#af8700"}, -- Arbitrary colors of the palette in the range from 16 to 255
  tab_bar = {
    background = tab_bg,

    active_tab = {
      bg_color      = '#000000',
      fg_color      = '#d0d0d0',
      intensity     = 'Normal', -- "Half" | "Normal" | "Bold"
      underline     = 'None',   -- "None" | "Single" | "Double"
      italic        = false,
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = tab_bg,
      fg_color = tab_fg,
    },

    inactive_tab_hover = {
      bg_color = tab_bg,
      fg_color = tab_fg,
    },

    new_tab = {
      bg_color = tab_bg,
      fg_color = tab_bg,
    },

    new_tab_hover = {
      bg_color = tab_bg,
      fg_color = tab_bg,
    }
  }
}

local rose_pine = {
  foreground      = '#e0def4',
  background      = '#191724',
  cursor_bg       = '#555169',
  cursor_fg       = '#e0def4',
  cursor_border   = '#555169',
  selection_fg    = '#e0def4',
  selection_bg    = '#2a2837',
  scrollbar_thumb = '#555169',
  split           = '#555169',
  ansi            = {'#26233a', '#eb6f92', '#31748f', '#f6c177', '#9ccfd8', '#c4a7e7', '#ebbcba', '#e0def4'},
  brights         = {'#6e6a86', '#eb6f92', '#31748f', '#f6c177', '#9ccfd8', '#c4a7e7', '#ebbcba', '#e0def4'},
  tab_bar = {
    background = tab_bg,

    active_tab = {
      fg_color      = '#e0def4',
      bg_color      = '#26233a',
      intensity     = 'Normal',
      underline     = 'None',
      italic        = false,
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = tab_bg,
      fg_color = tab_fg,
    },

    inactive_tab_hover = {
      bg_color = tab_bg,
      fg_color = tab_fg,
    },

    new_tab = {
      bg_color = tab_bg,
      fg_color = tab_bg,
    },

    new_tab_hover = {
      bg_color = tab_bg,
      fg_color = tab_bg,
    }
  }
}


return {
  font = wezterm.font_with_fallback {
    'JetBrains Mono', -- Fira Code / Iosevka / Cascadia Code
    'NotoSans Nerd Font',
    'Noto Sans Mono',
    'Noto Sans CJK JP DemiLight',
    'HanaMinA',
    'HanaMinB',
  },
  font_size                                   = 16.0,       -- [12.0]
  colors                                      = rose_pine,  -- color_scheme = "ayu", -- wezfurlong.org/wezterm/colorschemes/index.html
  -- color_scheme                                = 'Rosé Pine (base16)',

  window_padding                              = { left = 0, right = 0, top = 0, bottom = 0 },
  window_background_opacity                   = 1.0,
  enable_tab_bar                              = true,
  hide_tab_bar_if_only_one_tab                = true,
  use_fancy_tab_bar                           = false,
  adjust_window_size_when_changing_font_size  = false,
  -- front_end                                   = 'WebGpu',
  -- webgpu_power_preference                     = 'HighPerformance'
}
