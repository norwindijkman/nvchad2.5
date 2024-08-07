-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "gruvbox",

  statusline = {
    theme = "minimal",
    order = { "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp" },
    enabled = true,
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

-- Function to toggle the status bar
function ToggleStatusbar()
    M.ui.statusline.enabled = not M.ui.statusline.enabled
    if M.ui.statusline.enabled then
        vim.o.laststatus = 2  -- Show the status bar
        vim.o.cmdheight = 1   -- Show the command line
        os.execute("tmux set-option -g status on")  -- Show tmux status bar
    else
        vim.o.laststatus = 0  -- Hide the status bar
        vim.o.cmdheight = 0   -- Hide the command line
        os.execute("tmux set-option -g status off")  -- Hide tmux status bar
    end
end

-- Keybinding to toggle the status bar
vim.api.nvim_set_keymap('n', '<leader>ts', ':lua ToggleStatusbar()<CR>', { noremap = true, silent = true })

return M
