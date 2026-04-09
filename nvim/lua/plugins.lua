local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.o.termguicolors = true

require('lazy').setup({
  -- LSP
  'neovim/nvim-lspconfig',
  'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
  { 'NvChad/nvim-colorizer.lua', opts = {} },
  { 'nvim-lualine/lualine.nvim', opts = {} },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      filters = { dotfiles = false },
    },
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle file tree' },
      { '<C-e>', '<cmd>NvimTreeFindFile<CR>', desc = 'Find file in tree' },
      { '<leader>x', '<cmd>NvimTreeClose<CR><cmd>q<CR>', desc = 'Close tree and quit' },
      { '<leader>t', '<cmd>tab split<CR><cmd>NvimTreeFindFile<CR>', desc = 'Duplicate tab and find file' },
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').load_extension('fzf')
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require('nvim-treesitter').setup({
        highlight = {
          enable = true,

          -- Disable treesitter highlight for larger files.
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup({})
    end,
  },
}, {
  rocks = { enabled = false },
  performance = {
    rtp = {
      reset = false,
    },
  },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'TelescopePrompt',
  callback = function()
    vim.bo.autocomplete = false
  end,
})

-- Built-in autocomplete (Neovim 0.12+)
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.autocomplete = true
vim.keymap.set('i', '<CR>', function()
  return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
end, { expr = true })
