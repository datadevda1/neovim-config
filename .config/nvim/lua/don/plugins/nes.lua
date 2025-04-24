return {
  "Xuyuanp/nes.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {},
  -- lazy config
  keys = {
    {
      "<A-i>",
      function()
        require("nes").get_suggestion()
      end,
      mode = "i",
      desc = "[Nes] get suggestion",
    },
    {
      "<A-n>",
      function()
        require("nes").apply_suggestion(0, { jump = true, trigger = true })
      end,
      mode = "i",
      desc = "[Nes] apply suggestion",
    },
  },
}
