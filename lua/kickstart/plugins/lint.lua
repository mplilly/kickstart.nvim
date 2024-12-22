return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        python = { 'flake8' },
      }

      -- allow python files to have longer lines (can be configured in pyproject.toml)
      local flake8 = require('lint').linters.flake8
      flake8.args = {
        '--max-line-length=128',
      }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set('n', '<leader>l', function()
        require('lint').try_lint()
      end, { desc = 'Trigger liniting for current file' })
    end,
  },
}
