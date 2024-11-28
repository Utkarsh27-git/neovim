return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    -- Load undo extension
    telescope.load_extension("undo")
    vim.keymap.set("n", "<leader>u", telescope.extensions.undo.undo, {})
  end,
}
