local lspconfig = require('lspconfig')
lspconfig.texlab.setup {}
lspconfig.gdscript.setup {}
lspconfig.pylsp.setup {}
lspconfig.ccls.setup{}
lspconfig.hls.setup{}
lspconfig.lua_ls.setup{}
lspconfig.racket_langserver.setup{}
lspconfig.elixirls.setup{
	cmd={"elixir-ls"},
	    settings = {
        elixirLS = {
            dialyzerEnabled = true, 
            fetchDeps = false,     
        }
    }
}
lspconfig.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}
