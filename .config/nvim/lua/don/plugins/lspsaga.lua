return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      ft = { "json", "yaml", "lua", "python", "javascript", "typescript", "html", "css" },
      lightbulb = {
        enable = false,
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
