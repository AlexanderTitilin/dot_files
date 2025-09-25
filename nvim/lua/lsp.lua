local servers = {
  texlab = {},
  gdscript = {},
  pylsp = {},
  ccls = {},
  gopls = {},
  html = {},
  eslint = {},
  ts_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = {"vim"} },
        workspace = {
          checkThirdParty = false,
          telemetry = { enable = false },
          library = {
            "${3rd}/love2d/library"
          }
        }
      }
    }
  },
  racket_langserver = {},
  ["rust-analyzer"] = { 
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          enable = false,
        }
      }
    }
  }
}
for server,conf in pairs(servers) do
    vim.lsp.config(server,conf)
    vim.lsp.enable(server)
end

vim.diagnostic.config({
  virtual_text = false, 
})
