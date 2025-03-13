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


require('lazy').setup({
{
	"windwp/nvim-ts-autotag",
	opts = {}
},
{
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_execute_on_save = 0
	vim.g.db_ui_show_database_icon = 1
	vim.g.db_ui_auto_execute_table_helpers = 1
  end,
},
{
	'nvim-tree/nvim-tree.lua',
	opts = {
		view = {
			float = {
				enable = true
			},
		}
	}
},
{
	"micangl/cmp-vimtex"
},
{
  "S1M0N38/love2d.nvim",
  cmd = "LoveRun",
  opts = { },
  keys = {
    { "<leader>vs", ft = "lua", desc = "LÖVE" },
    { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
    { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
  },
},
{
	  "chentoast/marks.nvim",
	  event = "VeryLazy",
	  opts = {},
},
{
	"milanglacier/yarepl.nvim",
	config = true
},
{
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = true
},
{
	'yamatsum/nvim-cursorline',
	opts = {
	cursorline = {
    		enable = false,
  		},
  	cursorword = {
    		enable = true,
    		min_length = 3,
    hl = { underline = true },
  }
	}
},
{
    's1n7ax/nvim-terminal',
    opts = {}
},

    { 'norcalli/nvim-colorizer.lua',
    	config = function()
	    require("colorizer").setup()
    	end
   },
    { 'rebelot/kanagawa.nvim' },
    { 'jghauser/mkdir.nvim' },
    { 'Pocco81/auto-save.nvim',opts = {} },
    { 'kylechui/nvim-surround',opts = {} },
    { 'alvarosevilla95/luatab.nvim',
    	opts = {
		separator = function ()
			return "--"
		end
	} },
    { 'nvim-lualine/lualine.nvim',
    	opts =
    		{options ={ theme="gruvbox-material" }} },
    { 'quangnguyen30192/cmp-nvim-ultisnips' },
    { 'numToStr/Comment.nvim',opts={} },
    { 'm4xshen/autoclose.nvim',
    opts = {
    }},
    { 'nvim-telescope/telescope.nvim',opts = {}, dependencies = { 'nvim-lua/plenary.nvim' }},
    { 'is0n/jaq-nvim', opts =
    { cmds = {
	    external = {
		    python = "python %",
		    cpp = "c++ % -o $fileBase  && ./$fileBase",
		    c = "gcc % -o $fileBase  && ./$fileBase",
		    javascript = "node %",
		    scheme = "racket %",
		    racket = "racket %",
		    lisp = "sbcl --load %",
		    haskell = "stack ghc % && ./$fileBase",
		    html = "firefox %",
		    java = "java %",
		    lua = "lua %",
		    go = "go run %"
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
    { 'nvim-treesitter/nvim-treesitter',
    	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true
			}
	})
	end
     },
    { 'nvim-tree/nvim-web-devicons' },
    { 'lervag/vimtex', config = function()

	vim.g.tex_flavor = 'latex'
	vim.g.vimtex_quickfix_mode = 0
	vim.g.vimtex_view_method = 'zathura'
	vim.g.vimtex_compiler_progname = 'nvr'
	vim.g.vimtex_compiler_method = 'latexmk'
	vim.g.vimtex_compiler_latexmk_engines = { ['_'] = '-lualatex' }
	vim.g.tex_conceal = 'abdmg'

    end},
    { 'SirVer/ultisnips',config = function()
	    vim.g.UltiSnipsExpandTrigger = '<tab>'
	    vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
	    vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
    end},
})


