return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>l", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>r", ":Neotree filesystem reveal right<CR>", {})
    vim.keymap.set("n", "<leader>c", ":Neotree close<CR>", {})
    -- Map <leader>f to toggle Neo-tree
    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, noremap = true })
    -- Map <leader>f to focus Neo-tree if open, or toggle it if not
    vim.keymap.set("n", "<leader>f", "<C-w>w", { silent = true, noremap = true })
  end,
}
