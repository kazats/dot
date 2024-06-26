local wezterm = require 'wezterm';

local tab_fg  = '#6e6a86'
local tab_bg  = '#191724'

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
      fg_color      = tab_bg,
      bg_color      = tab_fg,
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


local function tab_title(tab_info)
  local title = tab_info.tab_title

  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  else
    return tab_info.active_pane.title
  end
end


wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    local max   = 17

    if string.len(title) > max then
      return {
        { Text = ' ' .. string.sub(title, 1, max) .. '… ' }
      }
    else
      return {
        { Text = string.format(' %-18s ', title) }
      }
    end
  end
)


return {
  font = wezterm.font_with_fallback {
    -- 'IBM Plex Mono',
    -- 'JetBrains Mono', --/ Fira Code / Iosevka / Cascadia Code
    'Iosevka Term Light Extended',
    'Noto Sans Mono',
    'Noto Color Emoji',
    'NotoSans Nerd Font',
    'IBM Plex Sans JP',
    'Noto Sans CJK JP DemiLight',
    'HanaMinA',
    'HanaMinB',
    'Unifont',
  },
  font_size                                   = 16,
  colors                                      = rose_pine,
  -- color_scheme                                = 'Rosé Pine (base16)',

  window_padding                              = { left = 0, right = 0, top = 0, bottom = 0 },
  window_background_opacity                   = 1.0,
  enable_tab_bar                              = true,
  hide_tab_bar_if_only_one_tab                = true,
  use_fancy_tab_bar                           = false,
  tab_max_width                               = 24,
  adjust_window_size_when_changing_font_size  = false,
  use_ime                                     = true,
  enable_kitty_keyboard                       = true,
  -- front_end                                   = 'WebGpu',
  -- webgpu_power_preference                     = 'HighPerformance'

  unix_domains = {
    {
      name = 'unix'
    }
  },

  ssh_domains = {
    {
      name = 'sora',
      remote_address = 'sora'
    },
    {
      name = 'mochi',
      remote_address = 'mochi'
    },
  },

  keys = {
    {
      key = 'u',
      mods = 'SHIFT|CTRL|ALT',
      action = wezterm.action.CharSelect {
        copy_on_select = true,
        copy_to = 'ClipboardAndPrimarySelection',
      },
    }
  },
}
