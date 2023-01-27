local wk = require('which-key')
local telescope_builtin = require('telescope.builtin')

wk.register({
  ['<leader>'] = {
    name = 'Leader',
    f = {
      name = 'Find',
      f = { telescope_builtin.find_files, 'Find files' },
      g = { telescope_builtin.live_grep, 'Live grep' },
    },
    l = {
      name = 'Language',
      v = { '<Plug>(toggle-lsp-diag-vtext)', 'Toggle virtual text' },
    }
  },
})