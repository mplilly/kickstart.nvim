-- MPL keymaps

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap for moving a line down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", {})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {})
-- scroll with cursor in middle of the screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})

-- alternate esc
vim.keymap.set('i', 'jk', '<Esc>', { desc = '<Esc> using jk' })
vim.keymap.set('i', 'kj', '<Esc>', { desc = '<Esc> using kj' })

-- buffer commands
vim.keymap.set('n', '[b', ':bprev<CR>', { desc = 'previous buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'next buffer' })
vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = 'delete buffer' })

-- cd to directory of current file
vim.keymap.set('n', '<leader>C', ':cd %:h', { desc = 'cd to directory of current file' })

-- Neorg keymap
vim.keymap.set({ 'n' }, '<Leader>ni', ':Neorg index<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<Leader>nc', ':Neorg toggle-concealer<CR>', { silent = true })

-- TODO: harpoon and gitsigns share the same keymaps, which-key is wrong too
-- Harpoon keymap
vim.keymap.set({ 'n' }, '<leader>m1', function()
  require('harpoon.ui').nav_file(1)
end, { desc = 'Harpoon file 1' })
vim.keymap.set({ 'n' }, '<leader>m2', function()
  require('harpoon.ui').nav_file(2)
end, { desc = 'Harpoon file 2' })
vim.keymap.set({ 'n' }, '<leader>m3', function()
  require('harpoon.ui').nav_file(3)
end, { desc = 'Harpoon file 3' })
vim.keymap.set({ 'n' }, '<leader>m4', function()
  require('harpoon.ui').nav_file(4)
end, { desc = 'Harpoon file 4' })
vim.keymap.set({ 'n' }, '<leader>ma', function()
  require('harpoon.mark').add_file()
end, { desc = 'Add file to Harpoon list' })
vim.keymap.set({ 'n' }, '<leader>mt', function()
  require('harpoon.ui').toggle_quick_menu()
end, { desc = 'toggle Harpoon list' })

-- Oil keymap
vim.keymap.set("n", "-", "<CMD>Oil<CR>", {desc = "Open parent directory"})

-- Undotree Keymaps
vim.keymap.set({ 'n' }, '<leader>ut', ':UndotreeToggle<CR>', { desc = 'toggle Undotree' })
