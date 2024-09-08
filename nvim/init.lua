local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set options
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'nvi'
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.autochdir = true
vim.opt.smartcase = true
vim.opt.conceallevel = 1
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.guifont = "JetBrainsMono Nerd Font:h14"
vim.opt.completeopt = { 'menu', 'menuone' }
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Plugin manager setup using lazy.nvim
require('lazy').setup({
    -- Plugins
    { 'norcalli/nvim-colorizer.lua',
    	config = function()
	    require("colorizer").setup()
    	end
   },
    { 'mfussenegger/nvim-dap' },
    { 'mfussenegger/nvim-dap-python', config = function()
	    				require("dap-python").setup("python")
    					end},
    { 'rebelot/kanagawa.nvim' },
    { 'jghauser/mkdir.nvim' },
    { 'Pocco81/auto-save.nvim',opts = {} },
    { 'kylechui/nvim-surround',opts = {} },
    { 'kyazdani42/nvim-tree.lua',opts = {} },
    { 'alvarosevilla95/luatab.nvim',opts = {} },
    { 'nvim-lualine/lualine.nvim',
    	opts =
    		{options ={ theme="gruvbox-material" }} },
    { 'quangnguyen30192/cmp-nvim-ultisnips' },
    { 's1n7ax/nvim-terminal',opts = {{
    	window = { position = 'rightbelow' }
}} },
    { 'numToStr/Comment.nvim',opts={} },
    { 'windwp/nvim-autopairs',opts = {} },
    { 'nvim-telescope/telescope.nvim',opts = {}, dependencies = { 'nvim-lua/plenary.nvim' }},
    { 'is0n/jaq-nvim', opts = 
    { cmds = {
	    external = {
		    python = "python %",
		    cpp = "g++ % -o $fileBase -O2 -lfinal && $fileBase",
		    javascript = "node %",
		    scheme = "racket %",
		    lisp = "sbcl --load %",
		    haskell = "stack ghc % && ./$fileBase",
		    html = "firefox %",
		    java = "java %",
		    lua = "lua %"
	    }
    },
    ui = {
	    startinsert = true,
	    float = {
		    border = "solid",
		    blend = 1
	    }
    } }},
    { 'sbdchd/neoformat' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'neovim/nvim-lspconfig' },
    { 'nvim-treesitter/nvim-treesitter',opts = {
	    highlight = {enable = true}
    } },
    { 'nvim-tree/nvim-web-devicons' },
    { 'lervag/vimtex' },
    { 'SirVer/ultisnips' },
})

-- Colorscheme
vim.cmd [[colorscheme kanagawa]]

-- VimTeX settings
vim.g.tex_flavor = 'latex'
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk_engines = { ['_'] = '-xelatex' }
vim.g.tex_conceal = 'abdmg'

-- UltiSnips settings
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'

-- Lua configuration for plugins
local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<C-s>'] = cmp.mapping.select_prev_item(),
        ['<C-w>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'path' },
    }
})

-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP settings
local lspconfig = require('lspconfig')
lspconfig.racket_langserver.setup {}
lspconfig.texlab.setup {}
lspconfig.bashls.setup {}
lspconfig.hls.setup {}
lspconfig.clangd.setup {}
lspconfig.gdscript.setup {}
lspconfig.pylsp.setup {}
lspconfig.lua_ls.setup {}


-- Key mappings
vim.api.nvim_set_keymap('n', '<Leader>s', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>c', ':Neoformat<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>j', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', ':Jaq terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>F', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>db', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>dc', '<Cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>dn', '<Cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>di', '<Cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>cn', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
