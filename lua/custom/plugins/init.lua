-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- tmux integration
  {
    'aserowy/tmux.nvim',
    opts = {},
  },

  -- {
  --   'akinsho/toggleterm.nvim',
  --   version = '*',
  --   opts = {},
  -- },

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      vim.g.copilot_proxy = 'https://proxy.sandia.gov:80'
      require('copilot').setup {}
    end,
  },

  {
    'folke/edgy.nvim',
    ---@module 'edgy'
    ---@param opts Edgy.Config
    opts = function(_, opts)
      for _, pos in ipairs { 'top', 'bottom', 'left', 'right' } do
        opts[pos] = opts[pos] or {}
        table.insert(opts[pos], {
          ft = 'snacks_terminal',
          size = { height = 0.4 },
          title = '%{b:snacks_terminal.id}: %{b:term_title}',
          filter = function(_buf, win)
            return vim.w[win].snacks_win
              and vim.w[win].snacks_win.position == pos
              and vim.w[win].snacks_win.relative == 'editor'
              and not vim.w[win].trouble_preview
          end,
        })
      end
    end,
  },

  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      terminal = { win = { style = 'terminal' } },
    },
    keys = {
      {
        '<leader>un',
        function()
          Snacks.notifier.hide()
        end,
        desc = 'Dismiss All Notifications',
      },
      {
        '<C-\\>',
        function()
          Snacks.terminal()
        end,
        desc = 'Toggle Terminal',
      },
      { '<Esc><Esc>', '<C-\\><C-n>', desc = 'Double <Esc> for normal mode in terminal' },
    },
  },

  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'kylechui/nvim-surround',
    -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true,
  },

  {
    'sindrets/diffview.nvim',
  },

  -- {
  --   'tpope/vim-fugitive',
  -- },

  {
    'mbbill/undotree',
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true,
    config = function()
      require('nvim-treesitter.config').setup {
        textobjects = {
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']f'] = { query = '@call.outer', desc = 'Next function call start' },
              [']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
              [']c'] = { query = '@class.outer', desc = 'Next class start' },
            },
            goto_next_end = {
              [']F'] = { query = '@call.outer', desc = 'Next function call end' },
              [']M'] = { query = '@function.outer', desc = 'Next method/function def end' },
              [']C'] = { query = '@class.outer', desc = 'Next class end' },
            },
            goto_previous_start = {
              ['[f'] = { query = '@call.outer', desc = 'Prev function call start' },
              ['[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
              ['[c'] = { query = '@class.outer', desc = 'Prev class start' },
            },
            goto_previous_end = {
              ['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
              ['[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
              ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
            },
          },
        },
      }
    end,
  },

  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },

  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    lazy = false,
    version = '*',
    -- config = true,
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {
            config = {
              folds = false,
              icon_preset = 'varied',
              icons = {
                todo = {
                  undone = {
                    icon = ' ',
                  },
                },
              },
            },
          },
          ['core.dirman'] = {
            config = {
              workspaces = {
                -- NOTE: need to adjust for mac vs windows
                notes = '~/smb/cee/Documents/notes',
              },
              default_workspace = 'notes',
            },
          },
          ['core.integrations.treesitter'] = {},
          ['core.export'] = {},
        },
      }
    end,
  },

  -- colorschemes

  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
  },
  {
    priority = 1000, -- Make sure to load this before all the other start plugins.
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    init = function()
      if vim.version().minor < 10 then
        -- use neovim default colorscheme for 0.10
        vim.cmd.colorscheme 'tokyonight-night'
      else
        vim.cmd.colorscheme 'default'
      end
    end,
  },
}
