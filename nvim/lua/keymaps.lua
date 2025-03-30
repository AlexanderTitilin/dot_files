vim.g.mapleader = ','
vim.g.maplocalleader = ' '
vim.api.nvim_set_keymap('n', '<Leader>s', ':split ', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsplit ', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>c', ':Neoformat<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>j', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', ':Jaq terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ff', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fp', ':NvimTreeOpen ~/projects<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fn', ':NvimTreeOpen ~/.config/nvim/lua<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>cn', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>sl', ':REPLSendLine<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>sv', '<Plug>(REPLSendVisual-ipython)', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>fr', ':Telescope oldfiles<CR>', { noremap = true, silent = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        vim.api.nvim_set_keymap("n", "cr", ":!cargo run<CR>", { noremap = true, silent = false })
        vim.api.nvim_set_keymap("n", "ct", ":!cargo test<CR>", { noremap = true, silent = false })
    end
})
