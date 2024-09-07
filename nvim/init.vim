filetype plugin on
" syntax on
set clipboard=unnamedplus
set mouse=nvi
set nohlsearch
set noswapfile
call plug#begin('~/.local/share/nvim/site')
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rebelot/kanagawa.nvim'
Plug 'jghauser/mkdir.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'smiteshp/nvim-navic'
Plug 'utilyre/barbecue.nvim'
Plug 'Pocco81/auto-save.nvim'
Plug 'kylechui/nvim-surround'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-surround'
Plug 'alvarosevilla95/luatab.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 's1n7ax/nvim-terminal'
Plug 'onsails/lspkind-nvim'
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'is0n/jaq-nvim'
Plug 'sbdchd/neoformat'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
call plug#end()
set smartcase 
" set smarttab 
colorscheme kanagawa
" let g:neon_italic_keyword = v:true
" let g:neon_italic_boolean = v:true
" let g:neon_italic_function = v:true
let g:rehash256 = 1
let g:tex_flavor = 'latex' 
let g:vimtex_quickfix_mode = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \}
" let g:vimtex_compiler_engine = 'lualatex'
set conceallevel=1
let g:tex_conceal='abdmg' 
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
set relativenumber
set guifont=JetBrainsMono\ Nerd\ Font:h14
let g:Powerline_symbols='unicode' 
" set guioptions+=m
let g:paredit_electric_return=0
let g:cursorword_highlight = 1
let mapleader = ','
let maplocalleader = ','
nnoremap <Leader>s :split<CR>
nnoremap <Leader>w :w<CR>
set completeopt=menu,menuone
lua << EOF
  local cmp = require 'cmp'

 cmp.setup {
     mapping = {
     ['<C-s>'] = cmp.mapping.select_prev_item(),
     ['<C-w>'] = cmp.mapping.select_next_item(),
     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
     ['<C-f>'] = cmp.mapping.scroll_docs(4),
     ['<C-e>'] = cmp.mapping.abort()
     
   },
   sources = {
      {name = 'nvim_lsp'},
      {name = 'nvim_lsp_signature_help'},
      { name = 'ultisnips' },
      { name = 'buffer'},
      { name = 'path' },
   },
 }
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local nvim_lsp = require('lspconfig')
require'lspconfig'.racket_langserver.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.clangd.setup{}
--require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.gdscript.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.lua_ls.setup{}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- local lsp_installer = require("nvim-lsp-installer")
 --lsp_installer.on_server_ready(function(server)
  --local opts = {}
   -- server:setup(opts)
-- end)
local on_attach = function(client, bufnr)
  --local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require'lspconfig'.html.setup {
  capabilities = capabilities
}
end
-- require('nvim-ts-autotag').setup()
    

local lspkind = require('lspkind')
 cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', 
      maxwidth = 50, 

      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
}
require('jaq-nvim').setup{
    cmds = {
        external = {
            python = "python %",
            cpp = "g++ % -o $fileBase -O2 -lfinal && $fileBase",
			javascript = "node %",
            scheme = "racket %",
            lisp = "sbcl --load %",
            haskell = "stack ghc  %  && ./$fileBase",
            html = "firefox %",
            java = "java %",
	    lua = "lua %"
            },
            },
        ui = {
            startinsert = true,
            float = {
                border ="solid",
                blend = 1}}}
require('telescope').setup{}
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
require('nvim-autopairs').setup{}
require('Comment').setup()
require('nvim-terminal').setup({
    window = {
        position = 'rightbelow',
        },
})
require('lualine').setup(
    {options = { theme = 'gruvbox-material'}}
)
require('luatab').setup({})

require("nvim-tree").setup()
require("nvim-surround").setup()
require("auto-save").setup()
require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
        }
    }
require("barbecue").setup()

local keymap = vim.keymap.set
require("dap-python").setup("python")
require'colorizer'.setup()
EOF
"
" set tabstop=4
" set shiftwidth=4
" set smarttab
" set expandtab 
" set softtabstop=4 
"
noremap <Leader>c :Neoformat<CR>
noremap <Leader>j :tabprevious<CR>
noremap <Leader>k :tabnext <CR>
noremap <Leader>r :Jaq terminal<CR>
noremap <Leader>t :tabnew<CR> 
noremap <Leader>f :NvimTreeFocus<CR>
noremap <Leader>F :Telescope find_files<CR>
noremap <Leader>m <Plug>(IPy-Run)
noremap <Leader>db <Cmd>lua require"dap".toggle_breakpoint()<CR>
noremap <Leader>dc <Cmd>lua require"dap".continue()<CR>
noremap <Leader>dn <Cmd>lua require"dap".step_over()<CR>
noremap <Leader>di <Cmd>lua require"dap".step_into()<CR>
noremap <Leader>cn <Cmd>lua vim.lsp.buf.rename()<CR>

