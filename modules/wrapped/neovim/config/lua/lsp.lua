if vim.lsp.config then
  vim.lsp.config("*", {
    capabilities = { textDocument = { semanticTokens = { multilineTokenSupport = true } } },
    root_markers = { ".git" },
  })

  vim.lsp.config("harper", {
    cmd = { "harper-ls", "--stdio" },
    filetypes = { "markdown", "text", "tex", "typst" },
  })

  vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
    root_markers = { "go.mod", "go.work" },
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
    root_markers = { "init.lua" },
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

  vim.lsp.config("marksman", {
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "markdown.mdx" },
    root_markers = { ".marksman.toml" },
  })

  vim.lsp.config("nixd", {
    cmd = { "nixd" },
    filetypes = { "nix" },
    root_markers = { "flake.nix" },
    settings = {
      nixd = {
        formatting = {
          command = { "alejandra" },
        },
      },
    },
  })

  vim.lsp.config("zk", {
    cmd = { "zk", "lsp" },
    filetypes = { "markdown" },
  })

  vim.lsp.config("zls", {
    cmd = { "zls" },
    filetypes = { "zig" },
    root_markers = { "build.zig" },
  })

  vim.lsp.config("racket_langserver", {
    cmd = { "racket", "--lib", "racket-langserver" },
    filetypes = { "racket", "scheme" },
  })

  vim.lsp.config("rust_analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "rust-project.json" },
    settings = {
      ["rust-analyzer"] = {
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
        diagnostics = {
          enable = true,
        },
      },
    },
  })
end

vim.lsp.enable({
  "gopls",
  "lua_ls",
  "harper",
  "marksman",
  "nixd",
  "racket_langserver",
  "rust_analyzer",
  "zk",
  "zls",
})
