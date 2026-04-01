local wk = require('which-key')
local telescope_builtin = require('telescope.builtin')

wk.add({
  { "<leader>", group = "Leader" },
  { "<leader>f", group = "Find" },
  { "<leader>ff", telescope_builtin.find_files, desc = "Find files" },
  { "<leader>fg", telescope_builtin.live_grep, desc = "Live grep" },
  { "<leader>l", group = "Language" },
  { "<leader>lv", function()
    local cfg = vim.diagnostic.config()
    vim.diagnostic.config({ virtual_text = not cfg.virtual_text })
  end, desc = "Toggle virtual text" },
})