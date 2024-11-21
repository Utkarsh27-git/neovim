return {
  "ThePrimeagen/harpoon",
  config = function()
    local harpoon_mark = require("harpoon.mark")
    local harpoon_ui = require("harpoon.ui")
    local harpoon_term = require("harpoon.term")

    -- Harpoon setup (can include other preferences if needed)
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = true,
        tmux_autoclose_windows = false,
      },
    })

    -- Key mappings
    vim.keymap.set("n", "<leader>ha", harpoon_mark.add_file, { desc = "Add file to Harpoon" })
    vim.keymap.set("n", "<leader>ui", harpoon_ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })

    -- Run the current file dynamically based on file type
    vim.keymap.set("n", "<leader>hr", function()
      local file_path = vim.fn.expand("%")       -- Get the current file path
      local file_type = vim.bo.filetype          -- Get the current file type

      -- Commands for each file type
      local commands = {
        python = "python3 " .. file_path,
        lua = "lua " .. file_path,
        javascript = "node " .. file_path,
        typescript = "ts-node " .. file_path,
        bash = "bash " .. file_path,
        go = "go run " .. file_path,
        java = "javac " .. file_path .. " && java " .. file_path:gsub("%.java$", ""),
      }

      -- Retrieve command or show error if unsupported
      local command = commands[file_type]
      if not command then
        print("Unsupported file type: " .. file_type)
        return
      end

      -- Send the command to Harpoon's terminal and focus on it
      harpoon_term.sendCommand(1, command .. "\n")
      harpoon_term.gotoTerminal(1)
    end, { desc = "Run file based on file type" })
  end,
}
