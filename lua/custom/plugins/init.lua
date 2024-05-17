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

  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    'mbbill/undotree',
  },

  {
    'nvim-neorg/neorg',
    ft = 'norg',
    build = ':Neorg sync-parsers',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'Neorg' },
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {
            config = {
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
                notes = '~/Documents/notes/',
              },
              default_workspace = 'notes',
            },
          },
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
        vim.cmd.colorscheme 'onedark'
      else
        vim.cmd.colorscheme 'default'
      end
    end,
  },
}
