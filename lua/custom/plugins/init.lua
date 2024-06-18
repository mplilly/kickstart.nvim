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
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    'kylechui/nvim-surround',
    -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = true
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'mbbill/undotree',
  },

  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },

  {
    'nvim-neorg/neorg',
    ft = 'norg',
    build = ':Neorg sync-parsers',
    dependencies = { 'luarocks.nvim' },
    cmd = { 'Neorg' },
    version = 'v7.0.0',
    priority = 30,
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
        vim.cmd.colorscheme 'onedark'
      else
        vim.cmd.colorscheme 'default'
      end
    end,
  },
}
