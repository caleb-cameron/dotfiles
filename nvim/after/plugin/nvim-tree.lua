-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local M = {}
local nvimtree = require("nvim-tree")
local api = require("nvim-tree.api")

-- empty setup using defaults

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

    -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not directory and not no_name then
    return
  end

  -- open the tree
  api.tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local function opts(desc)
	return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
end

-- function M.on_attach(bufnr)
--     vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
--     vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
--     vim.keymap.set('n', 'u', api.node.navigate.parent, opts('Parent Directory'))
-- end

nvimtree.setup({
    -- on_attach = M.on_attach,
    view = {
        width = 30,
    },
})

vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
    pattern = "NvimTree_*",
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
    end
})
