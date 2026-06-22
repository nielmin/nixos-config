-- 1. Automatically launch LSP when opening a specific file type
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "lua" }, -- Swapped "nix" for "go"
  callback = function(args)
    local bufnr = args.buf
    local ft = vim.bo[bufnr].filetype

    if ft == "go" then
      vim.lsp.start({
        name = "gopls",
        cmd = { "gopls" },
        root_dir = vim.fs.root(bufnr, { "go.mod", ".git" }),
      })
    elseif ft == "lua" then
      vim.lsp.start({
        name = "lua-language-server",
        cmd = { "lua-language-server" },
        root_dir = vim.fs.root(bufnr, { ".git" }),
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          },
        },
      })
    end
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})
