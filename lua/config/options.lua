vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.winborder = "bold"
vim.o.confirm = true

vim.o.updatetime = 250

vim.o.swapfile = false

vim.g.have_nerd_font = true

vim.schedule(function() vim.o.clipboard = "unnamedplus" end)

vim.diagnostic.config({
  virtual_text = true,
})
