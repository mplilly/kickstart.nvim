-- MPL autocommands
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufEnter' }, {
  pattern = '*.txt, *.norg',
  callback = function()
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})
