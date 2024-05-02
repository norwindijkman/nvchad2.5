return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"
      local telescope_harpoon = require('custom.telescope_harpoon')

      conf.defaults.mappings.i = {
        ["<TAB>"] = telescope_harpoon.mark_file,
      }
      return conf
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local conf = require "nvchad.configs.nvimtree"
      conf.view.width = 9999
      return conf
    end,
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      local conf = require "nvchad.configs.gitsigns"
      conf.signs = {
        add = { text = "󰙴" },
        change = { text = "󰏫" },
        delete = { text = "-" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "󰙴" },
      }
      conf.current_line_blame = true
      return conf
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "svelte",
        "tsx",
        "c",
        "php",
        "markdown",
        "markdown_inline",
        "dart"
      },
      indent = {
        enable = true,
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local conf = require "nvchad.configs.nvimtree"
      conf.actions.open_file.quit_on_open = true
      conf.renderer.icons.glyphs.git = {
        unstaged = "󰏫",
        staged = "✓",
        unmerged = "",
        renamed = "󰏫",
        untracked = "󰙴",
        deleted = "",
        ignored = "◌"
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "svelte-language-server",
        "deno",
        "prettier",

        -- php stuff
       "intelephense",

        -- c/cpp stuff
        "clangd",
        "clang-format",
  		},
  	},
  },
}
