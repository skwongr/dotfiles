local telescope_builtin = require('telescope.builtin')

vim.keymap.set({'n', 'v'}, 'cp', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', 'cv', '"+p', { desc = 'Paste from system clipboard' })

vim.keymap.set('n', '<leader>/', 'gcc', { remap = true, desc = 'Toggle comment' })
vim.keymap.set('v', '<leader>/', 'gc', { remap = true, desc = 'Toggle comment' })

vim.keymap.set('n', '<C-p>', function()
  vim.cmd('tabnew')
  require('telescope.builtin').git_files()
end, { desc = 'Find git files in new tab' })

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Live grep' })
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.keymap.set('n', '<C-t>', '<CR><C-w>T', { buffer = true, desc = 'Open in new tab' })
  end,
})

vim.keymap.set('v', '/?', function()
  vim.cmd('normal! y')
  local text = vim.fn.getreg('"')
  vim.cmd('tabnew')
  require('telescope.builtin').grep_string({ search = text })
end, { desc = 'Search selected text' })

vim.keymap.set('n', 'ttf', '<cmd>TestFile<CR>', { desc = 'Test file' })
vim.keymap.set('n', 'ttn', '<cmd>TestNearest<CR>', { desc = 'Test nearest' })

vim.keymap.set('n', '<leader>lv', function()
  local cfg = vim.diagnostic.config()
  vim.diagnostic.config({ virtual_text = not cfg.virtual_text })
end, { desc = 'Toggle virtual text' })
