return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup {}

      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<cr>", { desc = "Toggle NeoTree" })
      keymap.set("n", "<leader>td", "<cmd>Neotree close<cr>", { desc = "NeoTree close" })

    end,

}
