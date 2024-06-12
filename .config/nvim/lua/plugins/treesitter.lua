return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "cpp", "rust", "go", "lua", "vim", "vimdoc", "javascript", "html", "css" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
