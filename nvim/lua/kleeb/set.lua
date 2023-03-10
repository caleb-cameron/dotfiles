vim.g.mapleader = " "

-- Flash screen instead of beep sound.
vim.opt.visualbell = true

vim.cmd('colorscheme tender')
vim.g.airline_theme = 'tender'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Don't keep searches highlighted.
vim.opt.hlsearch = false

-- Incremental search
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 9
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Use GoImports on save, not GoFmt
vim.g.go_fmt_command = "goimports"

-- nvim-tree stuff
-- vim.api.nvim_create_augroup("NvimTreeToggle", {clear = true })
-- vim.api.nvim_create_autocmd("VimEnter"


