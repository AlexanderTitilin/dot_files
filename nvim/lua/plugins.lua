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

{
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
    })
  end,
},
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
		    racket = "racket %",
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
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
    end},
    { 'SirVer/ultisnips' },
})


