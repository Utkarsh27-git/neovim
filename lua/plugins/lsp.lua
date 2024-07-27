return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
      ensure_installed = {"lua_ls","markdown_oxide","terraformls","puppet"}})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "neovim/nvim-lspconfig",
	  config = function()
		  local lspconfig = require("lspconfig")
		  lspconfig.lua_ls.setup({})
      lspconfig.terraformls.setup({})
      lspconfig.puppet.setup({})
      vim.keymap.set('n','<leader>h',vim.lsp.buf.hover,{})
      vim.keymap.set('n','gd',vim.lsp.buf.definition,{})
      vim.keymap.set('n','<leader>ca',vim.lsp.buf.code_action,{})
	  end
  }
}

