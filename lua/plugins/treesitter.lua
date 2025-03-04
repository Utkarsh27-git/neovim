return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "bash", "lua", "vim", "vimdoc", "python", "yaml", "terraform", "puppet", "go" },
			sync_install = false,
			auto_install = true,
			highlight = {
				-- `false` will disable the whole extension
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
			indent = { enable = true },
		})
	end,
}
