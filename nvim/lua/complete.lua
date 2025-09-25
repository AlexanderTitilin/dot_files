
local cmp = require('cmp')
cmp.setup({
    snippet = {
	    expand = function (args)
	    	vim.fn["UltiSnips#Anon"](args.body)
	    end
    },
    mapping = {
        ['<C-s>'] = cmp.mapping.select_prev_item(),
        ['<C-w>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = true })
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'path' },
        -- {name = 'vimtex'},
        {name = 'vim-dadbod-completion'}
}
})
