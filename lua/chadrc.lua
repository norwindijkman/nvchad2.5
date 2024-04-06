-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "nightlamp",

  statusline = {
    theme = "minimal",
    order = { "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp" },
  },

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
    Visual = {
      bg = "#453b4a",
      fg = "#FFFFFF",
    },
    Normal = {
      bg = "#000000",
    },
	},
}

return M
