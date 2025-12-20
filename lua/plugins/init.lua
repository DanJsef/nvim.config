return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require "configs.leap"
    end,
  },

  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require "configs.neoscroll"
    end,
  },

  {
    "RRethy/vim-illuminate",
    lazy = false,
  },

  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
    },
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = { "davidmh/cspell.nvim" },
    opts = function(_, opts)
      local cspell = require "cspell"
      opts.sources = opts.sources or {}
      table.insert(
        opts.sources,
        cspell.diagnostics.with {
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity.HINT
          end,
        }
      )
      table.insert(opts.sources, cspell.code_actions)
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },

  {
    "esmuellert/vscode-diff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
  },
}
