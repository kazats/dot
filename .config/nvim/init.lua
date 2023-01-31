local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- vim.cmd [[,
--   augroup Packer
--     autocmd!
--     autocmd BufWritePost init.lua PackerCompile
--   augroup end
-- ]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'rose-pine/neovim',
    as = 'rose-pine',
  }

  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-fugitive'
  -- use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        signs                        = {
          add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        },
        signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked          = true,
        current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil, -- Use default
        max_file_length              = 40000,
        preview_config               = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        yadm                         = {
          enable = false
        },
      }
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use 'ludovicchabant/vim-gutentags'

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-media-files.nvim',
      'kyazdani42/nvim-web-devicons', opt = true
    },
    config = function()
      require('telescope').setup {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim"
          },
          mappings          = {
            i = {
              ["<C-u>"] = false,
              ["<C-j>"] = require('telescope.actions').move_selection_next,
              ["<C-k>"] = require('telescope.actions').move_selection_previous,
              ["<C-s>"] = require('telescope.actions').select_horizontal,
            },
            n = {
              ["cd"] = function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                require("telescope.actions").close(prompt_bufnr)
                -- Depending on what you want put `cd`, `lcd`, `tcd`
                vim.cmd(string.format("silent lcd %s", dir))
              end
            }
          },
          winblend          = 3,
          prompt_prefix     = ' ',
          selection_caret   = '⟩ ',
          multi_icon        = '┃',
          show_line         = false,
          borderchars       = {
            prompt  = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          },
          preview           = {
            msg_bg_fillchar = ""
          }
        },
        pickers = {
          find_files                = {
            results_title = '', preview_title = '', --prompt_title  = '',
            find_command = { 'fd', '-t', 'f', '-H', '--strip-cwd-prefix', '--ignore-file', '~/.fdignore' },
          },
          oldfiles                  = { results_title = '', preview_title = '' }, --prompt_title  = '',
          live_grep                 = { results_title = '', preview_title = '' }, --prompt_title  = '',
          grep_string               = { results_title = '', preview_title = '' }, --prompt_title  = '',
          buffers                   = { results_title = '', preview_title = '' }, --prompt_title  = '',
          help_tags                 = { results_title = '', preview_title = '' }, --prompt_title  = '',
          command_history           = { results_title = '', preview_title = '' }, --prompt_title  = '',
          commands                  = { results_title = '', preview_title = '' }, --prompt_title  = '',
          search_history            = { results_title = '', preview_title = '' }, --prompt_title  = '',
          man_pages                 = { results_title = '', preview_title = '' }, --prompt_title  = '',
          marks                     = { results_title = '', preview_title = '' }, --prompt_title  = '',
          media_files               = { results_title = '', preview_title = '' }, --prompt_title  = '',
          current_buffer_fuzzy_find = { results_title = '', preview_title = '' }, --prompt_title  = '',
          lsp_references            = { results_title = '', preview_title = '' }, --prompt_title  = '',
          lsp_document_symbols      = { results_title = '', preview_title = '' }, --prompt_title  = '',
        }
      }
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('media_files')
    end
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end
  }

  use 'kevinhwang91/rnvimr'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require 'nvim-tree'.setup {
        -- disable_netrw       = true,
        -- hijack_netrw        = true,
        -- open_on_setup       = false,
        -- ignore_ft_on_setup  = {},
        -- auto_close          = false,
        -- open_on_tab         = false,
        -- hijack_cursor       = false,
        -- update_cwd          = false,
        -- update_to_buf_dir   = {
        --   enable = true,
        --   auto_open = true,
        -- },
        diagnostics = {
          enable = true,
          icons = {
            hint    = "H", --
            info    = "I", --🛈
            warning = "W", --
            error   = "E", --
          }
        },
        update_focused_file = {
          enable      = false,
          update_cwd  = false,
          ignore_list = {}
        },
        system_open = {
          cmd  = nil,
          args = {}
        },
        filters = {
          dotfiles = false,
          custom   = {}
        },
        git = {
          enable = true,
          ignore = true,
          timeout = 500,
        },
        view = {
          width            = 30,
          -- height = 30,
          hide_root_folder = false,
          side             = 'left',
          adaptive_size    = false,
          mappings         = {
            custom_only = false,
            list = {}
          },
          number           = true,
          relativenumber   = true,
          signcolumn       = "no"
        },
        trash = {
          cmd             = "trash",
          require_confirm = true
        }
      }
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    -- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled        = false,
          theme                = 'auto',
          color                = { gui = '' },
          component_separators = { left = '', right = '' },
          section_separators   = { left = '', right = '' },
          disabled_filetypes   = {},
          always_divide_middle = false,
          globalstatus         = true,
        },
        sections = {
          lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            { 'buffers',
              show_filename_only   = true,
              show_modified_status = true,

              mode           = 2,
              max_length     = vim.o.columns * 2 / 3,
              filetype_names = {
                TelescopePrompt = 'telescope',
                dashboard       = 'dashboard',
                packer          = 'packer',
                fzf             = 'fzf',
                alpha           = 'alpha'
              },

              buffers_color = {
                active   = 'lualine_c_normal',
                inactive = 'lualine_c_inactive',
              }
            }
          },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = { 'nvim-tree' }
      }
    end
  }

  -- use 'lukas-reineke/indent-blankline.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-context'
  -- use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'drybalka/tree-climber.nvim'
  use {
    'andymass/vim-matchup',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }

  use {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup {
        dimming = {
          alpha = 0.25, -- amount of dimming
          -- we try to get the foreground from the highlight groups or fallback color
          color = { "Normal", "#ffffff" },
          term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
          inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        },
        context = 0, -- amount of lines we will try to show around the current line
        treesitter = true, -- use treesitter when available for the filetype
        -- treesitter is used to automatically expand the visible text,
        -- but you can further control the types of nodes that should always be fully expanded
        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {}, -- exclude these filetypes
      }
    end
  }

  use {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup {
      }
    end
  }

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    'jay-babu/mason-null-ls.nvim',
  }

  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    { 'hrsh7th/cmp-cmdline',
      config = function()
        require('cmp').setup.cmdline('/', {
          mapping = require('cmp').mapping.preset.cmdline(),
          sources = { { name = 'buffer' } }
        })

        require('cmp').setup.cmdline(':', {
          mapping = require('cmp').mapping.preset.cmdline(),
          sources = require('cmp').config.sources {
            { name = 'path' }
          }, {
            { name = 'cmdline',
              option = { ignore_cmds = { 'Man', '!' } } }
          }
        })
      end
    }
  }

  use {
    'mfussenegger/nvim-dap',
    { 'mfussenegger/nvim-dap-python',
      config = function()
        require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
      end
    },
    { 'theHamsta/nvim-dap-virtual-text',
      config = function()
        require("nvim-dap-virtual-text").setup {}
      end
    },
  }

  use {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
  }

  use 'h-hg/fcitx.nvim'
  use 'easymotion/vim-easymotion'
  use 'unblevable/quick-scope'
  use 'junegunn/vim-easy-align'
  use 'mtth/scratch.vim'
  -- use 'haya14busa/incsearch.vim'
  -- use {
  --   'karb94/neoscroll.nvim',
  --   config = function()
  --     require('neoscroll').setup()
  --   end
  -- }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup {
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
            border = "Normal",
            background = "Normal",
          }
        }
      }
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

  use {
    'dccsillag/magma-nvim',
    run = ':UpdateRemotePlugins'
  }
  -- use { 'untitled-ai/jupyter_ascending.vim' }
  -- use {
  --   'glacambre/firenvim',
  --   run = function()
  --     vim.fn['firenvim#install'](0)
  --   end
  -- }
end)


require('rose-pine').setup {
  bold_vert_split          = false,
  inactive_background      = false,
  disable_background       = false,
  disable_float_background = false,
  disable_italics          = true
}
vim.o.termguicolors = true
vim.g.rose_pine_variant = 'main'
vim.cmd.colorscheme 'rose-pine'


vim.diagnostic.config {
  virtual_text     = false,
  signs            = true,
  underline        = true,
  update_in_insert = false,
  severity_sort    = true,
}


vim.o.mouse       = 'a'
vim.o.updatetime  = 250
vim.o.hlsearch    = false
vim.o.incsearch   = true
vim.o.breakindent = true
vim.o.undofile    = true
vim.o.ignorecase  = true
vim.o.smartcase   = true
vim.o.completeopt = 'menuone,noselect'

vim.wo.number         = true
vim.wo.relativenumber = true
vim.wo.signcolumn     = 'yes'

vim.wo.foldmethod = 'expr'
vim.o.foldexpr    = 'nvim_treesitter#foldexpr()'

vim.g.scratch_insert_autohide = false
vim.g.scratch_filetype        = 'scratch'

vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
-- vim.cmd [[
--   augroup YankHighlight
--     autocmd!
--     autocmd TextYankPost * silent! lua vim.highlight.on_yank()
--   augroup end
-- ]]

--Map blankline
-- vim.g.indent_blankline_char = '┊' --┊┆│
-- vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
-- vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
-- vim.g.indent_blankline_show_trailing_blankline_indent = false

require('nvim-treesitter.configs').setup {
  auto_install = true,
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = 'gnn',
      node_incremental  = 'gin',
      node_decremental  = 'gdn',
      scope_incremental = 'gic',
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
        ["<localleader>mp"] = "@parameter.inner",
        ["<localleader>mf"] = "@function.outer",
        ["<localleader>mc"] = "@class.outer",
      },
      swap_previous = {
        ["<localleader>mP"] = "@parameter.inner",
        ["<localleader>mF"] = "@function.outer",
        ["<localleader>mC"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
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
}


local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = false }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
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
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so',
    [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

require('mason').setup()

require('mason-null-ls').setup {
  automatic_setup = true,
}
require('mason-null-ls').setup_handlers()

local mason_lspconfig = require('mason-lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup()
mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      -- on_attach = require('shared').on_attach,
      on_attach    = on_attach,
      capabilities = capabilities,
    }
  end
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'init.lua')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  -- cmd = { vim.fn.getenv 'HOME' .. '/.local/bin/sumneko_lua/bin/Linux/lua-language-server' },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require 'luasnip'
local cmp     = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
  }
}


vim.g.mapleader      = ','
vim.g.maplocalleader = '\\'


-- local map  = vim.api.nvim_set_keymap
local map  = vim.keymap.set
-- local bmap = vim.api.nvim_buf_set_keymap
-- local opt  = { noremap = true }
-- local opts = { noremap = true, silent = true }
local o    = {}
local o_s  = { silent = true }
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
    { 'Y', 'y$' },
    { l 'v', cmd 'tabedit $MYVIMRC' },

    { l 'w', cmd 'w' },
    { l 's', cmd 'wq' },
    { l 'a', cmd 'q' },
    { l 'A', cmd 'q!' },
    { l 'z', cmd 'qa' },
    { l 'Z', cmd 'qa!' },
    { l 'b', cmd 'bd' },
    { l 'B', cmd 'bd!' },

    { '<S-tab>', '<C-w><c-w>' },
    { l 'h', '<C-w>h' },
    { l 'j', '<C-w>j' },
    { l 'k', '<C-w>k' },
    { l 'l', '<C-w>l' },
    { l 'H', '<C-w>H' },
    { l 'J', '<C-w>J' },
    { l 'K', '<C-w>K' },
    { l 'L', '<C-w>L' },

    { l 'm', function() ts.find_files() end },
    { l 'r', function() ts.oldfiles() end },
    { l '/', function() ts.search_history() end },
    { l '\'', function() ts.marks() end },
    { l '<space>', function() ts.command_history() end },
    { l2 'g', function() ts.live_grep() end },
    { l2 'c', function() ts.grep_string() end },
    { l2 'b', function() ts.buffers() end },
    { l2 'h', function() ts.help_tags() end },
    { l2 'm', function() ts.man_pages() end },
    { l 'f', function() ts.current_buffer_fuzzy_find() end },
    { l2 'f', function() tsex.media_files.media_files() end },
    { l2 '<space>', function() ts.commands() end },

    { '<C-a>', cmd 'RnvimrToggle' },
    { '<C-n>', cmd 'NvimTreeToggle' },
    { ll2 't', cmd 'Twilight' },

    { ll '/', cmd 'noh' },
    { ll 'v', '"+gP' },
    { ll2 'q', 'gqip' },
    { ll2 'ft', 'Vatzf' },
    { ll2 'J', 'mqgg=G`qzz' },
    { ll2 'f', function() vim.lsp.buf.format() end },

    { '<c-k>', function() require('tree-climber').swap_prev() end },
    { '<c-j>', function() require('tree-climber').swap_next() end },
    -- {'n', 'v', 'o'}, 'H', require('tree-climber').goto_parent
    -- {'n', 'v', 'o'}, 'L', require('tree-climber').goto_child
    -- {'n', 'v', 'o'}, 'J', require('tree-climber').goto_next
    -- {'n', 'v', 'o'}, 'K', require('tree-climber').goto_prev
    -- {'v', 'o'},  'in',    require('tree-climber').select_node
    -- 'n',         '<c-h>', require('tree-climber').highlight_node
  },

  i = {
    { l 'm', '<esc>' },
    { ',\n', ',\n' },
    { l 'w', '<esc><cmd>w<cr>' },
    { ',,w', ',<esc><cmd>w<cr>' },
    { '<M-o>', '<esc>o' },
  },
})

local dap = require('dap')
maps(o_ns, {
  n = {
    { '<F5>', function() dap.continue() end },
    { '<F10>', function() dap.step_over() end },
    { '<F11>', function() dap.step_into() end },
    { '<F12>', function() dap.step_out() end },
    { l 'db', function() dap.toggle_breakpoint() end },
    { l 'dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end },
    { l 'dlp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },
    { l 'dr', function() dap.repl.open() end },
    { l 'dl', function() dap.run_last() end },
  }
})

local dap_python = require('dap-python')
maps(o_ns, {
  n = {
    { l 'dm', function() dap_python.test_method() end },
    { l 'dc', function() dap_python.test_class() end },
  },
  v = {
    { l 'ds',
      function()
        dap_python.debug_selection {}
        -- vim.api.nvim_input '<Esc>'
      end }
  },
})

-- map('n', ll2 'i', cmd 'MagmaInit',                o_s)
-- map('n', ll  'o', '<cmd>MagmaEvaluateOperator<cr>',   { noremap = true, silent = true, expr = true})
-- map('n', ll  'm', cmd 'MagmaEvaluateLine',        o_s)
-- map('x', ll  'm', cmd '<C-u>MagmaEvaluateVisual', o_s)
-- map('n', ll  'r', cmd 'MagmaReevaluateCell',      o_s)
-- map('n', ll2 'm', cmd 'MagmaDelete',              o_s)


vim.cmd [[
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

    set smartindent
    set autoindent

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


    iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.


    let mapleader      = ','
    let maplocalleader = '\'

    " nmap     <LocalLeader><LocalLeader>f :lua vim.lsp.buf.formatting_sync()<cr>
    " nmap     <LocalLeader>n              <Plug>JupyterExecute
    " nmap     <LocalLeader><localleader>n <Plug>JupyterExecuteAll

    " nnoremap <silent>       <LocalLeader><LocalLeader>i :MagmaInit<CR>
    " nnoremap <expr><silent> <LocalLeader>o              nvim_exec('MagmaEvaluateOperator', v:true)
    " nnoremap <silent>       <LocalLeader>m              :MagmaEvaluateLine<CR>
    " xnoremap <silent>       <LocalLeader>m              :<C-u>MagmaEvaluateVisual<CR>
    " nnoremap <silent>       <LocalLeader>r              :MagmaReevaluateCell<CR>
    " nnoremap <silent>       <LocalLeader><LocalLeader>m :MagmaDelete<CR>

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


    let g:EasyMotion_do_mapping = 1
    let g:EasyMotion_smartcase  = 1
    let g:EasyMotion_use_migemo = 1
    map  <LocalLeader>  <Plug>(easymotion-prefix)
    nmap s              <Plug>(easymotion-overwin-f)
    " map  <LocalLeader>j <Plug>(easymotion-j)
    " map  <LocalLeader>k <Plug>(easymotion-k)

    " map /  <Plug>(incsearch-forward)
    " map ?  <Plug>(incsearch-backward)
    " map g/ <Plug>(incsearch-stay)
    " let g:incsearch#auto_nohlsearch = 1
    " map n  <Plug>(incsearch-nohl-n)
    " map N  <Plug>(incsearch-nohl-N)
    " map *  <Plug>(incsearch-nohl-*)
    " map #  <Plug>(incsearch-nohl-#)
    " map g* <Plug>(incsearch-nohl-g*)
    " map g# <Plug>(incsearch-nohl-g#)

    nnoremap <silent> <C-c> :ColorizerToggle<cr>

    nnoremap <silent> <F11> :set spell!<cr>
    inoremap <silent> <F11> <C-o>:set spell!<cr>
]]

-- vim: ts=2 sts=2 sw=2 et
