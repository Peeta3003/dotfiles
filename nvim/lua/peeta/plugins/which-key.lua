return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",
    delay = 300,
    spec = {
      { "<leader>f", group = "find" },
      { "<leader>p", group = "project" },
      { "<leader>h", group = "git hunks", mode = { "n", "v" } },
      { "<leader>t", group = "toggle" },
    },
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer-local keymaps",
    },
  },
}
