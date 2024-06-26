return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = {
  --     "kevinhwang91/promise-async",
  --     "notomo/promise.nvim",
  --   },
  -- },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        lightbulb = {
          enable = false,
        },
        ft = { "python", "html", "lua", "json", "sql" },
      }
    end,
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require "dap.utils"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require "dap.utils"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
      { "rafamadriz/friendly-snippets" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "saadparwaiz1/cmp_luasnip" },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.custom_lspconfig"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = { "python" },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ltex-ls",
        "black",
        "debugpy",
        "mypy",
        "ruff-lsp",
        "pyright",
        "lua-language-server",
        "json-lsp",
        "html-lsp",
      },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    cmd = "Neogit",
    config = true,
    -- config = function()
    --   require("neogit").setup {
    --     kind = "split", -- opens neogit in a split
    --     signs = {
    --       -- { CLOSED, OPENED }
    --       section = { "", "" },
    --       item = { "", "" },
    --       hunk = { "", "" },
    --     },
    --     integrations = { diffview = true }, -- adds integration with diffview.nvim
    --   }
    -- end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        lsp = {
          signature = {
            enabled = false,
          },
          hover = {
            enabled = false,
          },
        },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
      vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next()
      end, { desc = "Next todo comment" })

      vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev()
      end, { desc = "Previous todo comment" })

      require("todo-comments").setup()
    end,
  },
  -- {
  --   "LunarVim/bigfile.nvim",
  --   config = function()
  --     -- default config
  --     require("bigfile").setup {
  --       filesize = 1,      -- size of the file in MiB, the plugin round file sizes to the closest MiB
  --       pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
  --       features = {       -- features to disable
  --         "indent_blankline",
  --         "illuminate",
  --         "lsp",
  --         "treesitter",
  --         "syntax",
  --         "matchparen",
  --         "vimopts",
  --         "filetype",
  --       },
  --     }
  --   end
  -- },
  {
    'SuperBo/fugit2.nvim',
    opts = {
      libgit2_path = 'libgit2.so.1.5',
      width = 150,
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      {
        'chrisgrieser/nvim-tinygit', -- optional: for Github PR view
        dependencies = { 'stevearc/dressing.nvim' }
      },
    },
    cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },
    keys = {
      { '<leader>fg', mode = 'n', '<cmd>Fugit2<cr>' }
    }
  },
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    config = {
      startVisible = true,
      showBlankVirtLine = true,
      highlightColor = { link = "Comment" },
      hints = {
        Caret = { text = "^", prio = 2 },
        Dollar = { text = "$", prio = 1 },
        MatchingPair = { text = "%", prio = 5 },
        Zero = { text = "0", prio = 1 },
        w = { text = "w", prio = 10 },
        b = { text = "b", prio = 9 },
        e = { text = "e", prio = 8 },
        W = { text = "W", prio = 7 },
        B = { text = "B", prio = 6 },
        E = { text = "E", prio = 5 },
      },
      gutterHints = {
        G = { text = "G", prio = 10 },
        gg = { text = "gg", prio = 9 },
        PrevParagraph = { text = "{", prio = 8 },
        NextParagraph = { text = "}", prio = 8 },
      },
    },
  },
  {
    "FelipeSanchezSoberanis/copy-path",
    event = { "BufNewFile", "BufReadPost", "BufWritePre", "BufWritePost" },
    config = function()
      local copy_path = require("copy-path")

      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "json" },
        callback = function(args)
          vim.keymap.set("n", "<leader>cp", function()
            copy_path.copy_json_path({ register = "+" })
          end, { buffer = args.buf })
        end
      })

      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        callback = function(args)
          vim.keymap.set("n", "<leader>cp", function()
            copy_path.copy_javascript_path({ register = "+" })
          end, { buffer = args.buf })
        end
      })
    end
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
