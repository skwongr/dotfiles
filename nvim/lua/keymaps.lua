local telescope_builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>lv', function()
  local cfg = vim.diagnostic.config()
  vim.diagnostic.config({ virtual_text = not cfg.virtual_text })
end, { desc = 'Toggle virtual text' })
