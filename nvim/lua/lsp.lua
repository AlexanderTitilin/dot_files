local lspconfig = require('lspconfig')
lspconfig.texlab.setup {}
lspconfig.gdscript.setup {}
lspconfig.pylsp.setup {}
lspconfig.ccls.setup{}
lspconfig.gopls.setup{}
lspconfig.lua_ls.setup{
	    Lua = {
      workspace = {
        checkThirdParty = false,
        telemetry = { enable = false },
        library = {
          "${3rd}/love2d/library"
        }
      }
    }
}
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
