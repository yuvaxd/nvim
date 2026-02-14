return {
  { "mason-org/mason.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp"
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      -- Fix for "Undefined global 'vim'" warning
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true)
            }
          }
        }
      })

      vim.lsp.enable({ 'lua_ls', 'ts_ls', 'gopls' })
    end,
  },
}
