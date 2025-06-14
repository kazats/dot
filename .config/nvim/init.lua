local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

require('lazy').setup({
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup({})
      vim.cmd.colorscheme('rose-pine')
    end,
  },

  'HiPhish/rainbow-delimiters.nvim',
  'lambdalisue/vim-suda',

  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  },

  {
      "rachartier/tiny-inline-diagnostic.nvim",
      event = "VeryLazy", -- Or `LspAttach`
      priority = 1000, -- needs to be loaded in first
      config = function()
          require('tiny-inline-diagnostic').setup({
        preset = 'simple'
      })
      end
  },

  -- {
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   opts = {},
  -- },

  -- -- { 'folke/which-key.nvim', config = true },
  -- {
  --   "folke/noice.nvim",
  --   config = function()
  --     require("noice").setup({
  --       lsp = {
  --           -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --           override = {
  --             ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --             ["vim.lsp.util.stylize_markdown"] = true,
  --             ["cmp.entry.get_documentation"] = true,
  --           },
  --         },
  --         -- you can enable a preset for easier configuration
  --         presets = {
  --           bottom_search = true, -- use a classic bottom cmdline for search
  --           command_palette = true, -- position the cmdline and popupmenu together
  --           long_message_to_split = true, -- long messages will be sent to a split
  --           inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --           lsp_doc_border = true, -- add a border to hover docs and signature help
  --         },
  --     })
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- },
  -- { "rcarriga/nvim-notify" },

  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = true,
  },

  -- {
  --   'folke/twilight.nvim',
  --   opts = {
  --     dimming = {
  --       alpha = 0.25, -- amount of dimming
  --       -- we try to get the foreground from the highlight groups or fallback color
  --       color = { 'Normal', '#ffffff' },
  --       term_bg = '#000000', -- if guibg=NONE, this will be used to calculate text color
  --       inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
  --     },
  --     context = 0, -- amount of lines we will try to show around the current line
  --     treesitter = true, -- use treesitter when available for the filetype
  --     -- treesitter is used to automatically expand the visible text,
  --     -- but you can further control the types of nodes that should always be fully expanded
  --     expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
  --       'function',
  --       'method',
  --       'table',
  --       'if_statement',
  --     },
  --     exclude = {}, -- exclude these filetypes
  --   },
  -- },

  -- { 'folke/zen-mode.nvim', config = true },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  { 'kylechui/nvim-surround', config = true },

  'tpope/vim-eunuch',
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',
  'tpope/vim-speeddating',
  'tpope/vim-dadbod',
  -- 'tpope/vim-fugitive',

  -- 'ludovicchabant/vim-gutentags',
  -- 'kevinhwang91/rnvimr',

  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<C-a>",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory" ,
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<leader>t',
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      open_for_directories = false,

      -- enable these if you are using the latest version of yazi
      use_ya_for_events_reading = true,
      use_yazi_client_id_flag = true,

      keymaps = {
        show_help = '<F1>',
      },
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-media-files.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('telescope').setup({
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim',
          },
          mappings = {
            i = {
              -- ['<C-u>']   = false,
              ['<C-j>']   = require('telescope.actions').move_selection_next,
              ['<C-k>']   = require('telescope.actions').move_selection_previous,
              ['<C-s>']   = require('telescope.actions').select_horizontal,
              ['<C-q>']   = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
              ['<C-S-q>'] = require('telescope.actions').smart_send_to_loclist + require('telescope.actions').open_qflist,
            },
            n = {
              ['cd'] = function(prompt_bufnr)
                local selection = require('telescope.actions.state').get_selected_entry()
                local dir = vim.fn.fnamemodify(selection.path, ':p:h')
                require('telescope.actions').close(prompt_bufnr)
                -- Depending on what you want put `cd`, `lcd`, `tcd`
                vim.cmd(string.format('silent lcd %s', dir))
              end,
            },
          },
          winblend = 3,
          prompt_prefix = ' ',
          selection_caret = '⟩ ',
          multi_icon = '┃',
          show_line = false,
          borderchars = {
            prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          },
          preview = {
            msg_bg_fillchar = '',
          },
        },
        pickers = {
          find_files = {
            results_title = '',
            preview_title = '', --prompt_title  = '',
            find_command = { 'fd', '-t', 'f', '-H', '--strip-cwd-prefix' },
          },
          oldfiles = { results_title = '', preview_title = '' }, --prompt_title  = '',
          live_grep = { results_title = '', preview_title = '' }, --prompt_title  = '',
          grep_string = { results_title = '', preview_title = '' }, --prompt_title  = '',
          buffers = { results_title = '', preview_title = '' }, --prompt_title  = '',
          help_tags = { results_title = '', preview_title = '' }, --prompt_title  = '',
          command_history = { results_title = '', preview_title = '' }, --prompt_title  = '',
          commands = { results_title = '', preview_title = '' }, --prompt_title  = '',
          search_history = { results_title = '', preview_title = '' }, --prompt_title  = '',
          man_pages = { results_title = '', preview_title = '' }, --prompt_title  = '',
          marks = { results_title = '', preview_title = '' }, --prompt_title  = '',
          media_files = { results_title = '', preview_title = '' }, --prompt_title  = '',
          current_buffer_fuzzy_find = { results_title = '', preview_title = '' }, --prompt_title  = '',
          lsp_references = { results_title = '', preview_title = '' }, --prompt_title  = '',
          lsp_document_symbols = { results_title = '', preview_title = '' }, --prompt_title  = '',
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({})
          }
        }
      })
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')
      require('telescope').load_extension('media_files')
      -- require('telescope').load_extension('flutter')
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '-' },
        topdelete    = { text = '±' },
        changedelete = { text = '≂' },
      },
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      attach_to_untracked = false,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text         = true,
        virt_text_pos     = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay             = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
    },
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    version = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    -- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        color = { gui = '' },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = false,
        globalstatus = false,
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            'buffers',
            show_filename_only = true,
            show_modified_status = true,

            mode = 2,
            max_length = vim.o.columns * 2 / 3,
            filetype_names = {
              TelescopePrompt = 'telescope',
              dashboard = 'dashboard',
              packer = 'packer',
              fzf = 'fzf',
              alpha = 'alpha',
            },

            buffers_color = {
              active = 'lualine_c_normal',
              inactive = 'lualine_c_inactive',
            },
          },
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      -- 'JoosepAlviste/nvim-ts-context-commentstring',
      'drybalka/tree-climber.nvim',
      'nushell/tree-sitter-nu',
      {
        'andymass/vim-matchup',
        config = function()
          vim.g.matchup_matchparen_offscreen = { method = 'popup' }
        end,
      },
    },
  },

  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'nvimtools/none-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
    },
  },

  {
    'mrcjkb/haskell-tools.nvim',
    version = '^4',
    lazy = false,
    -- ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  },

  {
    'isovector/cornelis',
    name = 'cornelis',
    ft = 'agda',
    -- build = 'stack install',
    dependencies = {'neovimhaskell/nvim-hs.vim', 'kana/vim-textobj-user'},
    version = 'v2.7.*',
  },

  'liuchengxu/vim-which-key',

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      {
        'hrsh7th/cmp-cmdline',
        config = function()
          require('cmp').setup.cmdline('/', {
            mapping = require('cmp').mapping.preset.cmdline(),
            sources = { { name = 'buffer' } },
          })

          require('cmp').setup.cmdline(':', {
            mapping = require('cmp').mapping.preset.cmdline(),
            sources = require('cmp').config.sources({
              { name = 'path' },
            },
            {
              {
                name = 'cmdline',
                option = { ignore_cmds = { 'Man', '!' } },
              },
            }),
          })
        end,
      },
    },
  },

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'mfussenegger/nvim-dap-python',
        config = function()
          require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
        end,
      },
      { 'theHamsta/nvim-dap-virtual-text', config = true },
    },
  },

  -- {
  --     'lewis6991/hover.nvim',
  --     config = function()
  --       require('hover').setup({
  --           init = function()
  --             -- Require providers
  --             require('hover.providers.lsp')
  --             -- require('hover.providers.gh')
  --             -- require('hover.providers.gh_user')
  --             -- require('hover.providers.jira')
  --             -- require('hover.providers.man')
  --             -- require('hover.providers.dictionary')
  --           end,
  --           preview_opts = {
  --               border = 'single',
  --           },
  --           -- Whether the contents of a currently open hover window should be moved
  --           -- to a :h preview-window when pressing the hover keymap.
  --           preview_window = false,
  --           title = false,
  --       })
  --
  --       -- Setup keymaps
  --       vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
  --       vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)' })
  --     end,
  -- },

  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    run = 'make install_jsregexp',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },

  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  -- 'Nash0x7E2/awesome-flutter-snippets',

  -- {
  --   'ggandor/leap.nvim',
  --   config = function()
  --     require('leap').add_default_mappings()
  --   end,
  -- },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  'h-hg/fcitx.nvim',
  -- 'easymotion/vim-easymotion',
  'unblevable/quick-scope',
  'junegunn/vim-easy-align',
  'mtth/scratch.vim',

  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        size = 20, -- | function(term)
        -- if term.direction == "horizontal" then
        --   return 15
        -- elseif term.direction == "vertical" then
        --   return vim.o.columns * 0.4
        -- end
        -- end,
        open_mapping = [[<c-\>]],
        -- on_open = fun(t: Terminal), -- function to run when the terminal opens
        -- on_close = fun(t: Terminal), -- function to run when the terminal closes
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
        persist_size = true,
        direction = 'float', --'vertical' | 'horizontal' | 'window' | 'float',
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
        -- This field is only relevant if direction is set to 'float'
        float_opts = {
          -- The border key is *almost* the same as 'nvim_open_win'
          -- see :h nvim_open_win for details on borders however
          -- the 'curved' border is a custom border type
          -- not natively supported but implemented in this plugin.
          border = 'single', -- | 'double' | 'shadow' | 'curved' | ... other options supported by win open
          -- width = <value>,
          -- height = <value>,
          winblend = 3,
          highlights = {
            border = 'Normal',
            background = 'Normal',
          },
        },
      })
    end,
  },

  { 'windwp/nvim-autopairs', config = true },

  {
    'rrethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        providers = {
          'lsp',
          'treesitter',
          'regex',
        },
        delay = 100,
        filetype_overrides = {},
        filetypes_denylist = {
          'dirbuf',
          'dirvish',
          'fugitive',
        },
        filetypes_allowlist = {},
        modes_denylist = {},
        modes_allowlist = {},
        providers_regex_syntax_denylist = {},
        providers_regex_syntax_allowlist = {},
        under_cursor = true,
        large_file_cutoff = nil,
        large_file_overrides = nil,
        min_count_to_highlight = 2,
        should_enable = function(_) return true end,
        case_insensitive_regex = false
      })
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  -- {
  --   'dccsillag/magma-nvim',
  --   build = ':UpdateRemotePlugins',
  -- },

  -- {
  --   'akinsho/flutter-tools.nvim',
  --   dependencies = 'nvim-lua/plenary.nvim',
  -- },

  {
    'echasnovski/mini.indentscope',
    version = false,
    config = function()
      require('mini.indentscope').setup({
        draw = {
          animation = require('mini.indentscope').gen_animation.none()
        },
        symbol = '│'
      })
    end
  },

  {
    'echasnovski/mini.files',
    version = false,
    config = function()
      require('mini.files').setup({})

      vim.keymap.set('n', '<localleader>f',
        function ()
          require('mini.files').open()
        end,
        { noremap=true, silent=true })
    end
  },

  {
    'echasnovski/mini.ai',
    version = '*'
  },


  -- -- 'lukas-reineke/indent-blankline.nvim'
  -- -- 'nvim-treesitter/nvim-treesitter-refactor'
  -- -- use 'haya14busa/incsearch.vim'
  -- -- use {
  -- --   'karb94/neoscroll.nvim',
  -- --   config = function()
  -- --     require('neoscroll').setup()
  -- --   end
  -- -- }
  },

  {
    ui = {
      border = 'single'
    }
  })

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.o.mouse = 'a'
vim.o.updatetime = 250
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.completeopt = 'menuone,noselect'
vim.o.splitbelow = true
vim.o.splitright = true

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'

vim.o.foldenable     = true
vim.o.foldlevel      = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod     = 'expr'
vim.o.foldexpr       = 'v:lua.vim.treesitter.foldexpr()'

vim.g.scratch_insert_autohide = false
vim.g.scratch_filetype = 'scratch'

vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo", { desc = "move highlighted text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo", { desc = "move highlighted text up" })

--Map blankline
-- vim.g.indent_blankline_char = '┊' --┊┆│
-- vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
-- vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
-- vim.g.indent_blankline_show_trailing_blankline_indent = false

require('nvim-treesitter.configs').setup({
  ensure_installed = {},
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  modules = {},
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<Enter>',
      node_incremental = 'v',
      node_decremental = 'V',
      scope_incremental = '<S-Enter>',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["aC"] = "@conditional.outer",
        ["iC"] = "@conditional.inner",
        ["iS"] = "@statement.inner",
        ["aS"] = "@statement.outer",

        -- nu
        ["aP"] = "@pipeline.outer",
        ["iP"] = "@pipeline.inner",
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = 'V', -- blockwise
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<localleader>mp'] = '@parameter.inner',
        ['<localleader>mf'] = '@function.outer',
        ['<localleader>mc'] = '@class.outer',
      },
      swap_previous = {
        ['<localleader>mP'] = '@parameter.inner',
        ['<localleader>mF'] = '@function.outer',
        ['<localleader>mC'] = '@class.outer',
      },
    },
    lsp_interop = {
      enable = true,
      border = 'single',
      peek_definition_code = {
        ['<leader>df'] = '@function.outer',
        ['<leader>dF'] = '@class.outer',
      },
    },
    context_commentstring = {
      enable = true,
    },
    matchup = {
      enable = true,
    },
    -- refactor = {
    --   highlight_definitions = {
    --     enable = true, -- Set to false if you have an `updatetime` of ~100.
    --     clear_on_cursor_move = true,
    --   },
    --   highlight_current_scope = { enable = true },
    -- },
  },
})

local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config({
  float = { border = _border }
})

require('lspconfig.ui.windows').default_options = {
  border = _border
}

local lspconfig = require('lspconfig')
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = false }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>R', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', ':Trouble<cr>', opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    'n',
    '<leader>ls',
    [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    'n',
    '<leader>lo',
    [[<cmd>lua require('telescope.builtin').lsp_outgoing_calls()<CR>]],
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    'n',
    '<leader>li',
    [[<cmd>lua require('telescope.builtin').lsp_incoming_calls()<CR>]],
    opts
  )
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end

require('mason').setup({
  ui = {
    border = 'single'
  }
})
require('mason-null-ls').setup({
  automatic_installation = false,
  ensure_installed = {},
  handlers = {}
})
require('null-ls').setup({
  -- debug = true,
  -- sources = {
  --   require('null-ls').builtins.formatting.fourmolu.with({
  --     extra_args = { "--indentation", "8" }
  --   })
  -- }
})
-- require('mason-null-ls').setup_handlers({})

local mason_lspconfig = require('mason-lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.gleam.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- lspconfig.nushell.setup({
--   on_attach = on_attach,
--   capabilities = capabilities
-- })

mason_lspconfig.setup()
-- mason_lspconfig.setup_handlers({
--   function(server_name)
--     if server_name == 'sumneko_lua' then
--       lspconfig[server_name].setup({
--         on_attach = on_attach,
--         capabilities = capabilities,
--         settings = {
--           Lua = {
--             completion = {
--               callSnippet = 'Replace',
--             },
--           },
--         },
--       })
--     -- elseif server_name == 'hls' then
--     --   lspconfig[server_name].setup({
--     --     on_attach = on_attach,
--     --     capabilities = capabilities,
--     --     settings = {
--     --       haskell = {
--     --         formattingProvider = "fourmolu",
--     --         -- plugin = {
--     --         --   ghcideCodeActionsTypeSignatures = true
--     --         -- }
--     --       },
--     --     },
--     --   })
--     elseif server_name == 'julials' then
--       lspconfig[server_name].setup({
--         on_attach = on_attach,
--         capabilities = capabilities,
--         root_dir = function(fname)
--           local util = require('lspconfig.util')
--           return util.root_pattern 'Project.toml'(fname) or vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1]) or vim.fs.dirname(fname)
--         end
--       })
--     else
--       lspconfig[server_name].setup({
--         on_attach = on_attach,
--         capabilities = capabilities,
--       })
--     end
--   end,
-- })

-- require('flutter-tools').setup({
--   ui = {
--     -- the border type to use for all floating windows, the same options/formats
--     -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
--     border = 'single',
--     -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
--     -- please note that this option is eventually going to be deprecated and users will need to
--     -- depend on plugins like `nvim-notify` instead.
--     -- notification_style = 'native' | 'plugin',
--     notification_style = 'plugin'
--   },
--   decorations = {
--     statusline = {
--       -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
--       -- this will show the current version of the flutter app from the pubspec.yaml file
--       app_version = false,
--       -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
--       -- this will show the currently running device if an application was started with a specific
--       -- device
--       device = false,
--     },
--   },
--   widget_guides = {
--     enabled = true,
--   },
--   closing_tags = {
--     highlight = 'Comment', -- highlight for the closing tag
--     prefix = '/', -- character to use for close tag e.g. > Widget
--     enabled = true, -- set to false to disable
--   },
--   dev_log = {
--     enabled = true,
--     open_cmd = 'tabedit', -- command to use to open the log buffer
--   },
--   dev_tools = {
--     autostart = false, -- autostart devtools server if not detected
--     auto_open_browser = false, -- Automatically opens devtools in the browser
--   },
--   outline = {
--     open_cmd = '30vnew', -- command to use to open the outline buffer
--     auto_open = false, -- if true this will open the outline automatically when it is first populated
--   },
--   lsp = {
--     color = { -- show the derived colours for dart variables
--       enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
--       background = false, -- highlight the background
--       background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
--       foreground = false, -- highlight the foreground
--       virtual_text = true, -- show the highlight using virtual text
--       virtual_text_str = '■', -- the virtual text character to highlight
--     },
--     on_attach = on_attach,
--     capabilities = capabilities, -- e.g. lsp_status capabilities
--     -- see the link below for details on each option:
--     -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
--     settings = {
--       showTodos = true,
--       completeFunctionCalls = true,
--       -- analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
--       renameFilesWithClasses = 'prompt', -- "always"
--       enableSnippets = true,
--     },
--   },
-- })

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs( -4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete({}),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable( -1) then
        luasnip.jump( -1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
  },
})

-- local map  = vim.api.nvim_set_keymap
local map = vim.keymap.set
-- local bmap = vim.api.nvim_buf_set_keymap
-- local opt  = { noremap = true }
-- local opts = { noremap = true, silent = true }
local o = {}
local o_s = { silent = true }
local o_ns = { noremap = true, silent = true }
local o_se = { silent = true, expr = true }

local function maps(o, defs)
  for mode, bindings in pairs(defs) do
    for _, binding in pairs(bindings) do
      map(mode, binding[1], binding[2], o)
    end
  end
end

local function l(k)
  return string.format('<leader>%s', k)
end

local function l2(k)
  return string.format('<leader><leader>%s', k)
end

local function ll(k)
  return string.format('<localleader>%s', k)
end

local function ll2(k)
  return string.format('<localleader><localleader>%s', k)
end

local function cmd(c)
  return string.format('<cmd>%s<cr>', c)
end

local ts = require('telescope.builtin')
local tsex = require('telescope').extensions

maps(o, {
  n = {
    { '<space>', ':' },
  },
})

maps(o_ns, {
  n = {
    { 'Y',       'y$' },
    { '<C-y',    'yygccp' },
    { l('v'),    cmd('tabedit $MYVIMRC') },

    { l('w'),    cmd('w') },
    { l('s'),    cmd('wq') },
    { l('a'),    cmd('q') },
    { l('A'),    cmd('q!') },
    { l('z'),    cmd('qa') },
    { l('Z'),    cmd('qa!') },
    { l2('b'),   cmd('bd') },
    { l2('B'),   cmd('bd!') },

    { '<S-tab>', '<C-w><c-w>' },
    { l('h'),    '<C-w>h' },
    { l('j'),    '<C-w>j' },
    { l('k'),    '<C-w>k' },
    { l('l'),    '<C-w>l' },
    { l('H'),    '<C-w>H' },
    { l('J'),    '<C-w>J' },
    { l('K'),    '<C-w>K' },
    { l('L'),    '<C-w>L' },

    { '<C-d>',   '<C-d>zz' },
    { '<C-u>',   '<C-u>zz' },

    {
      l('m'),
      function()
        ts.find_files()
      end,
    },
    {
      l('g'),
      function()
        ts.git_files()
      end,
    },
    {
      l('r'),
      function()
        ts.oldfiles()
      end,
    },
    {
      l('/'),
      function()
        ts.search_history()
      end,
    },
    {
      l("'"),
      function()
        ts.marks()
      end,
    },
    {
      l('<space>'),
      function()
        ts.command_history()
      end,
    },
    {
      l2('g'),
      function()
        ts.live_grep()
      end,
    },
    {
      l2('c'),
      function()
        ts.grep_string()
      end,
    },
    {
      l('b'),
      function()
        ts.buffers()
      end,
    },
    {
      l2('h'),
      function()
        ts.help_tags()
      end,
    },
    {
      l2('m'),
      function()
        ts.man_pages()
      end,
    },
    {
      l('f'),
      function()
        ts.current_buffer_fuzzy_find()
      end,
    },
    {
      l2('f'),
      function()
        tsex.media_files.media_files()
      end,
    },
    {
      l2('<space>'),
      function()
        ts.commands()
      end,
    },
    -- {
    --   l2('l'),
    --   function()
    --     tsex.flutter.commands()
    --   end,
    -- },

    -- { '<C-a>',   cmd('RnvimrToggle') },
    { '<C-n>',   cmd('Neotree toggle') },
    { ll2('t'),  cmd('Twilight') },

    { ll('/'),   cmd('noh') },
    { ll('v'),   '"+gP' },
    { ll2('q'),  'gqip' },
    { ll2('ft'), 'Vatzf' },
    { ll2('J'),  'mqgg=G`qzz' },
    {
      ll2('f'),
      function()
        vim.lsp.buf.format()
      end,
    },
    {
      ll2('n'),
      function()
        require('illuminate').goto_next_reference()
      end,
    },
    {
      ll2('p'),
      function()
        require('illuminate').goto_prev_reference()
      end,
    },

    {
      '<c-s-j>',
      function()
        require('tree-climber').swap_prev()
      end,
    },
    {
      '<c-j>',
      function()
        require('tree-climber').swap_next()
      end,
    },
    -- {'n', 'v', 'o'}, 'H', require('tree-climber').goto_parent
    -- {'n', 'v', 'o'}, 'L', require('tree-climber').goto_child
    -- {'n', 'v', 'o'}, 'J', require('tree-climber').goto_next
    -- {'n', 'v', 'o'}, 'K', require('tree-climber').goto_prev
    -- {'v', 'o'},  'in',    require('tree-climber').select_node
    -- 'n',         '<c-h>', require('tree-climber').highlight_node
  },
  i = {
    { l('m'),  '<esc>' },
    { ',\n',   ',\n' },
    { l('w'),  '<esc><cmd>w<cr>' },
    { ',,w',   ',<esc><cmd>w<cr>' },
    { '<M-o>', '<esc>o' },
  },
})

local dap = require('dap')

-- dap.adapters.cppdbg = {
--   id = 'cppdbg',
--   type = 'executable',
--   command = '/home/v/.local/opt/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7',
-- }

-- dap.configurations.fortran = {
--   {
--     name = "Launch file",
--     type = "cppdbg",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopAtEntry = true,
--   },
--   {
--     name = 'Attach to gdbserver :1234',
--     type = 'cppdbg',
--     request = 'launch',
--     MIMode = 'gdb',
--     miDebuggerServerAddress = 'localhost:1234',
--     miDebuggerPath = '/usr/bin/gdb',
--     cwd = '${workspaceFolder}',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--   },
-- }


vim.g.cornelis_use_global_binary = 1

maps(o_ns, {
  n = {
    {
      '<F5>',
      function()
---@diagnostic disable-next-line: undefined-field
        dap.continue({})
      end,
    },
    {
      '<F10>',
      function()
---@diagnostic disable-next-line: undefined-field
        dap.step_over()
      end,
    },
    {
      '<F11>',
      function()
---@diagnostic disable-next-line: undefined-field
        dap.step_into()
      end,
    },
    {
      '<F12>',
      function()
---@diagnostic disable-next-line: undefined-field
        dap.step_out()
      end,
    },
    {
      l('db'),
      function()
---@diagnostic disable-next-line: undefined-field
        dap.toggle_breakpoint()
      end,
    },
    {
      l('dB'),
      function()
---@diagnostic disable-next-line: undefined-field
        dap.set_breakpoint(vim.fn.input({ 'Breakpoint condition: ' }))
      end,
    },
    {
      l('dlp'),
      function()
---@diagnostic disable-next-line: undefined-field
        dap.set_breakpoint(nil, nil, vim.fn.input({ 'Log point message: ' }))
      end,
    },
    {
      l('dr'),
      function()
---@diagnostic disable-next-line: undefined-field
        dap.repl.open()
      end,
    },
    {
      l('dl'),
      function()
---@diagnostic disable-next-line: undefined-field
        dap.run_last()
      end,
    },
  },
})

local dap_python = require('dap-python')
maps(o_ns, {
  n = {
    {
      l('dm'),
      function()
        dap_python.test_method()
      end,
    },
    {
      l('dc'),
      function()
        dap_python.test_class()
      end,
    },
  },
  v = {
    {
      l('ds'),
      function()
        dap_python.debug_selection({})
        -- vim.api.nvim_input '<Esc>'
      end,
    },
  },
})

-- vim.opt.sh = "/usr/bin/nu"
-- vim.opt.shelltemp = false
-- vim.opt.shellredir = "out+err> %s"
-- vim.opt.shellcmdflag = "--login --stdin --no-newline -c"
-- vim.opt.shellxescape = ""
-- vim.opt.shellxquote = ""
-- vim.opt.shellquote = ""
-- vim.opt.shellpipe = '| complete | update stderr { ansi strip } | tee { get stderr | save --force --raw %s } | into record'

vim.cmd([[
    set shell=/bin/bash

    set foldnestmax=3
    set foldlevel=10
    set foldenable

    set autowrite
    set noruler
    set timeoutlen=500
    set hidden

    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    set backspace=2
    set expandtab

    set virtualedit=all

    set cursorline
    set showcmd

    " set smartindent
    " set autoindent

    set noshowmode
    set laststatus=2
    set linespace=0

    set nowrap
    " set textwidth=79
    " set colorcolumn=79
    set formatoptions=qrn1

    set mousehide
    set dictionary+=/home/v/.vimdict

    set history=1000
    set listchars=tab:›\ ,trail:·
    set list

    set smarttab

    set scrolloff=5
    set sidescrolloff=10
    set sidescroll=1

    set matchtime=2
    set showmatch

    set splitbelow

    " set wildmode=list:longest
    " set wildmenu
    set wildignore=*.o,*~,*.hi,*.bin,*.cfg,*.pdf,*.ps,*.swp,*.class

    set spelllang=en,de,cjk
    " set complete+=kspell


    let mapleader      = ','
    let maplocalleader = '\'

    " nmap     <LocalLeader><LocalLeader>f :lua vim.lsp.buf.formatting_sync()<cr>
    " nmap     <LocalLeader>n              <Plug>JupyterExecute
    " nmap     <LocalLeader><localleader>n <Plug>JupyterExecuteAll

    "nnoremap <silent>       <LocalLeader><LocalLeader>i :MagmaInit<CR>
    "nnoremap <expr><silent> <LocalLeader>o              nvim_exec('MagmaEvaluateOperator', v:true)
    "nnoremap <silent>       <LocalLeader>m              :MagmaEvaluateLine<CR>
    "xnoremap <silent>       <LocalLeader>m              :<C-u>MagmaEvaluateVisual<CR>
    "nnoremap <silent>       <LocalLeader>r              :MagmaReevaluateCell<CR>
    "nnoremap <silent>       <LocalLeader><LocalLeader>m :MagmaDelete<CR>

    " nnoremap <LocalLeader><LocalLeader>q gqip
    " nnoremap <LocalLeader><LocalLeader>ft Vatzf
    " nnoremap <LocalLeader><LocalLeader>J mqgg=G`qzz
    "
    " nnoremap <LocalLeader>v "+gP
    " nnoremap <silent><LocalLeader>/ :noh<cr>
    " nmap \\ gcc
    " vmap \\ gc

    " silent inoremap <leader>m <esc>
    " silent inoremap <leader>w <esc><cmd>w<cr>
    " silent inoremap ,,w       ,<esc><cmd>w<cr>
    "
    " imap <m-o> <esc>o


    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)


    " let g:EasyMotion_do_mapping = 1
    " let g:EasyMotion_smartcase  = 1
    " let g:EasyMotion_use_migemo = 1
    " map  <LocalLeader>  <Plug>(easymotion-prefix)
    " nmap s              <Plug>(easymotion-overwin-f)
    " map  <LocalLeader>j <Plug>(easymotion-j)
    " map  <LocalLeader>k <Plug>(easymotion-k)

    nnoremap <silent> <C-c> :ColorizerToggle<cr>

    nnoremap <silent> <F11> :set spell!<cr>
    inoremap <silent> <F11> <C-o>:set spell!<cr>


    au BufRead,BufNewFile *.agda call AgdaFiletype()
    au QuitPre *.agda :CornelisCloseInfoWindows
    function! AgdaFiletype()
        nnoremap <buffer> <localleader>l :CornelisLoad<CR>
        nnoremap <buffer> <localleader>r :CornelisRefine<CR>
        nnoremap <buffer> <localleader>d :CornelisMakeCase<CR>
        nnoremap <buffer> <localleader>, :CornelisTypeContext<CR>
        nnoremap <buffer> <localleader>. :CornelisTypeContextInfer<CR>
        nnoremap <buffer> <localleader>n :CornelisSolve<CR>
        nnoremap <buffer> <localleader>a :CornelisAuto<CR>
        nnoremap <buffer> gd             :CornelisGoToDefinition<CR>
        nnoremap <buffer> [/             :CornelisPrevGoal<CR>
        nnoremap <buffer> ]/             :CornelisNextGoal<CR>
        nnoremap <buffer> <C-A>          :CornelisInc<CR>
        nnoremap <buffer> <C-X>          :CornelisDec<CR>
    endfunction

    " inoremap <localleader> <C-O>:call cornelis#prompt_input()<CR>
]])

-- vim: ts=2 sts=2 sw=2 et
