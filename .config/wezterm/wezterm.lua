local wezterm = require 'wezterm';
local act = wezterm.action

local tab_fg  = '#6e6a86'
local tab_bg  = '#191724'

local rose_pine = {
  foreground      = '#e0def4',
  background      = '#191724',
  cursor_bg       = '#555169',
  cursor_fg       = '#e0def4',
  cursor_border   = '#555169',
  selection_fg    = '#191724',
  selection_bg    = '#f6c177',
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
    local max   = 29

    if string.len(title) > max then
      return {
        { Text = ' ' .. string.sub(title, 1, max) .. '… ' }
      }
    else
      return {
        { Text = string.format(' %-30s ', title) }
      }
    end
  end
)


wezterm.on(
  'update-status',
  function(window, pane)
    -- local color_scheme = window:effective_config().resolved_palette
    -- local bg = color_scheme.background
    -- local fg = color_scheme.foreground

    window:set_right_status(wezterm.format({
      { Background = { Color = tab_bg } },
      { Foreground = { Color = tab_fg } },
      { Text = ' ' .. pane:get_domain_name() .. ' ' },
    }))
  end
)


return {
  font = wezterm.font_with_fallback {
    -- 'IBM Plex Mono',
    -- 'JetBrains Mono', --/ Fira Code / Iosevka / Cascadia Code
    -- 'IosevkaTerm NF Light',
    -- 'NotoSans Nerd Font',
    'IosevkaTerm NF',
    'Noto Sans Mono',
    'Noto Color Emoji',
    'Symbols Nerd Font Mono',
    'IBM Plex Sans JP',
    'Noto Sans CJK JP DemiLight',
    'HanaMinA',
    'HanaMinB',
    'Unifont',
  },
  font_size                                   = 14,
  colors                                      = rose_pine,
  -- color_scheme                                = 'Catppuccin Mocha',

  window_padding                              = { left = 0, right = 0, top = 0, bottom = 0 },
  window_background_opacity                   = 1.0,
  scrollback_lines                            = 5000,
  enable_tab_bar                              = true,
  hide_tab_bar_if_only_one_tab                = true,
  use_fancy_tab_bar                           = false,
  tab_max_width                               = 32,
  adjust_window_size_when_changing_font_size  = false,
  use_ime                                     = true,
  enable_kitty_keyboard                       = true,
  max_fps                                     = 240,
  -- enable_wayland                              = false,
  -- front_end                                   = 'WebGpu',
  -- webgpu_power_preference                     = 'HighPerformance'

  ssh_domains = {
    { name = 'fight',
      remote_address = 'fight'
    },
  },

  keys = {
    { key = 'UpArrow',
      mods = 'SHIFT|CTRL',
      action = act.ScrollToPrompt(-1) },
    { key = 'DownArrow',
      mods = 'SHIFT|CTRL',
      action = act.ScrollToPrompt(1) },


    { key = 'h',
      mods = 'CTRL|ALT',
      action = act.ActivatePaneDirection('Left')
    },
    { key = 'l',
      mods = 'CTRL|ALT',
      action = act.ActivatePaneDirection('Right')
    },
    { key = 'k',
      mods = 'CTRL|ALT',
      action = act.ActivatePaneDirection('Up')
    },
    { key = 'j',
      mods = 'CTRL|ALT',
      action = act.ActivatePaneDirection('Down')
    },
    { key = '/',
      mods = 'CTRL|ALT',
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' })
    },
    { key = '-',
      mods = 'CTRL|ALT',
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' })
    },


    { key = 'f',
      mods = 'SHIFT|CTRL|ALT',
      action = act.AttachDomain('fight')
    },
    { key = 'd',
      mods = 'SHIFT|CTRL',
      action = act.DetachDomain('CurrentPaneDomain')
    },


    { key = 'F2',
      mods = '',
      action = wezterm.action.QuickSelectArgs {
        label = 'open url',
        patterns = {
          '(?:https?://|ftp://|file://)\\S+', -- url
          '(?:[.\\w\\-@~]+)?(?:/+[.\\w\\-@]+)+', -- path
        },
        -- skip_action_on_paste = true,
        action = wezterm.action_callback(function(window, pane)
          local url = window:get_selection_text_for_pane(pane)
          wezterm.log_info('opening: ' .. url)
          wezterm.open_with(url)
        end),
      },
    },
  },

  mouse_bindings = {
    { event = { Down = { button = 'Left', streak = 3 } },
      action = act.SelectTextAtMouseCursor 'SemanticZone',
      mods = 'NONE',
    },
  }
}
