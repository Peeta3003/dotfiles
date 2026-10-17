return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofumpt" },
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      sql = { "sql_formatter" },
    },
    formatters = {
      sql_formatter = {
        prepend_args = { "-l", "mysql" }, -- swap for "postgresql", "sqlite", etc.
      },
    },
    format_on_save = function(bufnr)
      local enabled = {
        go = true, lua = true, python = true,
        c = true, cpp = true,
        json = true, sql = true, html = true, css = true,
      }
      if not enabled[vim.bo[bufnr].filetype] then
        return
      end
      return { timeout_ms = 1000, lsp_format = "fallback" }
    end,
  },
}
