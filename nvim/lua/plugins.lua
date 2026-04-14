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
  {
    'lisposter/vim-blackboard',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme blackboard')
    end,
  },
  { 'NvChad/nvim-colorizer.lua', opts = {} },
  'HiPhish/rainbow-delimiters.nvim',
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  { 'kylechui/nvim-surround', opts = {} },
  'christoomey/vim-sort-motion',
  'tpope/vim-endwise',
  'vim-test/vim-test',
  {
    'folke/flash.nvim',
    opts = {},
    keys = {
      { '<C-f>', function() require('flash').jump() end, mode = { 'n', 'x', 'o' }, desc = 'Flash' },
    },
  },
  { 'nvim-lualine/lualine.nvim', opts = {} },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      filters = { dotfiles = false, git_ignored = false },
      actions = { open_file = { window_picker = { enable = false } } },
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', 't', api.node.open.tab, { buffer = bufnr, desc = 'Open in new tab' })
      end,
    },
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle file tree' },
      { '<C-e>', '<cmd>NvimTreeFindFile<CR>', desc = 'Find file in tree' },
      { '<leader>x', '<cmd>NvimTreeClose<CR><cmd>q<CR>', desc = 'Close tree and quit' },
      { '<leader>t', '<cmd>tab split<CR><cmd>NvimTreeFindFile<CR>', desc = 'Duplicate tab and find file' },
    },
  },

  {
    'godlygeek/tabular',
    cmd = 'Tab',
    keys = {
      { '<leader>:', ':Tab /:\\zs/l0l1<CR>', mode = 'v', desc = 'Align on colon' },
      { '<leader>=', ':Tab /=<CR>', mode = 'v', desc = 'Align on =' },
      { '<leader>{', ':Tab /{<CR>', mode = 'v', desc = 'Align on {' },
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          path_display = { 'truncate' },
        },
      })
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
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup()

      -- Auto-install parser and start treesitter
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
          if not lang then return end
          local available = require('nvim-treesitter').get_available()
          if not vim.list_contains(available, lang) then return end
          if not vim.list_contains(require('nvim-treesitter').get_installed(), lang) then
            require('nvim-treesitter').install(lang)
          end
          pcall(vim.treesitter.start)
        end,
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

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'handlebars',
  callback = function()
    vim.bo.commentstring = '{{! %s }}'
  end,
})

-- Built-in autocomplete (Neovim 0.12+)
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.autocomplete = true
vim.keymap.set('i', '<CR>', function()
  return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
end, { expr = true })
