return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "golangci_lint_ls" },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      local on_attach = function(client, bufnr)
        -- Helper to define buffer-local keymaps
        local buf_set_keymap = function(mode, lhs, rhs, opts)
          opts = opts or { noremap = true, silent = true }
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- LSP-specific keymaps
        buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
        buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
        buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
        buf_set_keymap("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>")

        -- Example: Format on save (optional)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = true })
            end,
          })
        end
      end

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "lua" }, -- Lua filetypes
      })

      lspconfig.terraformls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "terraform", "tf" }, -- Terraform filetypes
      })

      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach, -- Attach the custom function
        filetypes = { "python", "py" },
      })

      lspconfig.golangci_lint_ls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settins = {
          gopls = {
            completeUnimported = true,
            userPlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      })

      lspconfig.puppet.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "puppet", "pp" }, -- Puppet filetypes
      })
    end,
  },
}
