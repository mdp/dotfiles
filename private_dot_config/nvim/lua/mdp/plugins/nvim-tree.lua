return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>tt", "<cmd>NvimTreeFocus<cr>", { desc = "Toggle NvimTree" })
    keymap.set("n", "<leader>td", "<cmd>NvimTreeClose<cr>", { desc = "NvimTree close" })
    keymap.set("n", "<leader>tc", "<cmd>NvimTreeClipboard<cr>", { desc = "NvimTree Clipboard" })

  end,
}
