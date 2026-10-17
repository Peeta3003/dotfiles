return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "go", "gomod", "python", "c", "cpp", "lua", "vim", "vimdoc",
      "bash", "json", "markdown", "markdown_inline", "sql", "php",
      "javascript", "html", "css", "query",
    })

    -- the main branch doesn't enable highlighting on its own
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "go", "gomod", "python", "c", "cpp", "lua", "vim", "help",
        "sh", "json", "markdown", "sql", "php", "javascript", "html", "css",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
