local lspconfig = require('lspconfig')
lspconfig.texlab.setup {}
lspconfig.gdscript.setup {}
lspconfig.pylsp.setup {}
lspconfig.ccls.setup{}
lspconfig.hls.setup{}
lspconfig.racket_langserver.setup{}
lspconfig.elixirls.setup{
	cmd={"elixir-ls"},
	    settings = {
        elixirLS = {
            dialyzerEnabled = true,  -- Включи Dialyzer для статического анализа
            fetchDeps = false,       -- В зависимости от твоих предпочтений
        }
    }
}
require'lspconfig'.ccls.setup{}
