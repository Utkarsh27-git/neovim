  return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "java", "html","python","yaml","terraform","puppet"},
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end  
  }

