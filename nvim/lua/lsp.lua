local nvim_lsp = require('lspconfig')
local lsp_configs = require('lspconfig.configs')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  local function map(key, fn, desc)
    vim.keymap.set('n', key, fn, { buffer = bufnr, silent = true, desc = desc })
  end

  -- Open in new tab, then jump
  local function tab_jump(method)
    return function() vim.cmd('tab split') method() end
  end

  map('gD', tab_jump(vim.lsp.buf.declaration), 'LSP declaration')
  map('gd', tab_jump(vim.lsp.buf.definition), 'LSP definition')
  map('K', vim.lsp.buf.hover, 'LSP hover')
  map('gi', tab_jump(vim.lsp.buf.implementation), 'LSP implementation')
  map('<leader>lk', vim.lsp.buf.signature_help, 'LSP signature help')
  map('<leader>rn', vim.lsp.buf.rename, 'LSP rename')
  map('gr', tab_jump(vim.lsp.buf.references), 'LSP references')
  map('[d', vim.diagnostic.goto_prev, 'Previous diagnostic')
  map(']d', vim.diagnostic.goto_next, 'Next diagnostic')
end

-- Hide virtual text
vim.diagnostic.config({ virtual_text = false, update_in_insert = false })

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local function setup_server(name)
  if not lsp_configs[name] then
    local ok, config = pcall(require, 'lspconfig.configs.' .. name)
    if ok then
      lsp_configs[name] = config
    end
  end

  local server = lsp_configs[name]
  if not server then
    return
  end

  server.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

local servers = { 'solargraph', 'terraformls', 'tflint', 'ts_ls' }
for _, lsp in ipairs(servers) do
  setup_server(lsp)
end
