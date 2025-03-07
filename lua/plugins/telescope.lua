return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        fzf = {},
      },
    })                             -- Initialize Telescope
    telescope.load_extension("undo") -- Load undo extension

    local builtin = require("telescope.builtin")
    -- Keymaps
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>vp", function()
      builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
    end, { desc = "[S]earch [N]eovim files" })
    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })
    vim.keymap.set("n", "<leader>u", telescope.extensions.undo.undo, {})

    --- find files in all repos
    vim.keymap.set("n", "<leader>ga", function()
      require("telescope.builtin").find_files({
        cwd = "/mnt/c/Devops", -- Set search root
        hidden = false,    -- Show hidden files
        no_ignore = false, -- Respect .gitignore
      })
    end, { desc = "[G]it [A]ll Files in DevOps (Respect .gitignore)" })
  end,
}
