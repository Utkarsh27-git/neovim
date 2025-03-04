return {
  "folke/noice.nvim",
  config = function()
    local noice = require("noice")

    noice.setup({
      -- Customize `msg_show` event filters to allow macro recording message
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
              { find = "%d fewer lines" },
              { find = "%d more lines" },
            },
          },
          opts = { skip = true }, -- Skip unnecessary messages as before
        },
      },
    })

    -- Keymap to dismiss Noice messages
    vim.keymap.set("n", "<leader>dm", function()
      vim.cmd("Noice dismiss")
    end, { desc = "Dismiss Noice notifications and clear hlsearch" })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
