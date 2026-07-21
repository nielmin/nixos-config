if vim.lsp.config then
  vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
    root_markers = { "go.mod", "go.work", ".git" },
    settings = {
      gopls = {
        gofumpt = true,
        staticcheck = true,
        analyses = {
          nilness = true,
          unusedparams = true,
        },
      },
    },
  })

  vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { "init.lua", ".git" },
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global variable
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })

  vim.lsp.config("nixd", {
    cmd = { "nixd" },
    filetypes = { "nixd" },
    root_markers = { "flake.nix", ".git" },
  })

  vim.lsp.config("zls", {
    cmd = { "zls" },
    filetypes = { "zig" },
    root_markers = { "build.zig" },
  })

  vim.lsp.config("racket_langserver", {
    cmd = { "racket", "--lib", "racket-langserver" },
    filetypes = { "racket", "scheme" },
    root_markers = { ".git" },
  })
end

vim.lsp.enable({
  "gopls",
  "lua_ls",
  "racket_langserver",
  "zls",
})
