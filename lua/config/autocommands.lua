-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', {}),
  callback = function() vim.hl.on_yank() end,
})

-- Extra LSP related keymaps to go with the defaults
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Setup LSP keymaps, autoformatting, inlay-hints toggle, etc.",
  group = vim.api.nvim_create_augroup("lsp-attach-keymaps", {}),
  callback = function(event)
    vim.keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "Goto Definition" })
    vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- Format on save
    if client and client:supports_method("textDocument/formatting", event.buf) then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Format buffer on save using LSP",
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = event.buf, id = client.id })
        end,
      })
    end

    -- Inlay hints toggle
    if client and client:supports_method("textDocument/inlayHint", event.buf) then
      vim.keymap.set(
        "n",
        "<leader>th",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
        end,
        { desc = "Toggle inlay hints" }
      )
    end
  end
})
