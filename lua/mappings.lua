require "nvchad.mappings"

local map = vim.keymap.set

-- Normal mode mappings
vim.keymap.set("n", "y", '"+y', { noremap = true })
vim.keymap.set("n", "yy", '"+yy', { noremap = true })
vim.keymap.set("n", "Y", '"+Y', { noremap = true })
vim.keymap.set("n", "p", '"+p', { noremap = true })
vim.keymap.set("n", "P", '"+P', { noremap = true })
vim.keymap.set("n", "]p", '"+]p', { noremap = true })
vim.keymap.set("n", "]P", '"+]P', { noremap = true })
vim.keymap.set("n", "[p", '"+[p', { noremap = true })
vim.keymap.set("n", "[P", '"+[P', { noremap = true })
vim.keymap.set("n", "gp", '"+gp', { noremap = true })
vim.keymap.set("n", "gP", '"+gP', { noremap = true })

-- Visual mode mappings
vim.keymap.set("v", "y", '"+y', { noremap = true })
vim.keymap.set("v", "Y", '"+Y', { noremap = true })
vim.keymap.set("v", "p", '"+p', { noremap = true })
vim.keymap.set("v", "P", '"+P', { noremap = true })

-- Operator-pending mode mappings (for yanking with motions)
vim.keymap.set("o", "y", '"+y', { noremap = true })

-- GitSigns navigation
map('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal({']c', bang = true})
  else
    require('gitsigns').nav_hunk('next')
  end
end)
map('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal({'[c', bang = true})
  else
    require('gitsigns').nav_hunk('prev')
  end
end)

-- nvchad ui term 
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle {
    id = "floatTerm",
    pos = "float",
    float_opts = {
      relative = "editor",
      row = 0,
      col = 0,
      width = 1,
      height = .95,
      border = "none",
    },
  }
end, { desc = "Terminal Toggle Floating term" })
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle {
    id = "vtoggleTerm",
    pos = "float",
    float_opts = {
      relative = "editor",
      row = 0,
      col = 0,
      width = 1,
      height = .95,
      border = "none",
    },
  }
end, { desc = "terminal toggleable vertical term" })
map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle {
    id = "htoggleTerm",
    pos = "float",
    float_opts = {
      relative = "editor",
      row = 0,
      col = 0,
      width = 1,
      height = .95,
      border = "none",
    },
  }
end, { desc = "terminal new horizontal term" })

map("n", "<C-c>", ":nohlsearch<CR><Esc>", { desc = "Exit" })
map("v", "<C-c>", ":nohlsearch<CR><Esc>", { desc = "Exit" })
map("i", "<C-c>", "<Esc>:nohlsearch<CR>", { desc = "Exit" })
map("c", "<C-c>", "<C-c>:nohlsearch<CR>", { desc = "Exit" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-n>", "<cmd> NvimTreeClose <CR>", { desc = "Close nvimtree" })
map("v", ">", ">gv", { desc = "Indent forward" })
map("v", "<", "<gv", { desc = "Indent backward" })

map("n", "<leader>lw", ":lua ToggleWrap()<CR>", { desc = "Toggle line wrap" })
map("n", "<A-j>", "4j", { desc = "Move down 4 lines" })
map("n", "<A-k>", "4k", { desc = "Move up 4 lines" })
map("v", "<A-j>", "4j", { desc = "Move down 4 lines in visual mode" })
map("v", "<A-k>", "4k", { desc = "Move up 4 lines in visual mode" })

map("n", "<C-A-j>", "16j", { desc = "Move down 16 lines" })
map("n", "<C-A-k>", "16k", { desc = "Move up 16 lines" })
map("v", "<C-A-j>", "16j", { desc = "Move down 16 lines in visual mode" })
map("v", "<C-A-k>", "16k", { desc = "Move up 16 lines in visual mode" })

map("n", "<Leader>cn", "<cmd>CreateDateFile<CR>", { desc = "Create a new file with the current date" })
map("n", "<leader>pp", "<cmd>GrepInNvimTreeFolder<CR>", { desc = "Grep in NvimTree folder" })

map("n", "<Leader>]", "<cmd>NextFile<CR>", { desc = "Go to next file" })
map("n", "<Leader>[", "<cmd>PrevFile<CR>", { desc = "Go to previous file" })

-- Harpoon
map("n", "<leader>h", function()
  local harpoon = require "harpoon"
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle harpoon" })
map("n", "<leader>a", function()
  local harpoon = require "harpoon"
  harpoon:list():add()
end, { desc = "Toggle add current buffer" })
map("n", "<leader>1", function()
  local harpoon = require "harpoon"
  harpoon:list():select(1)
end, { desc = "Harpoon select 1" })
map("n", "<leader>2", function()
  local harpoon = require "harpoon"
  harpoon:list():select(2)
end, { desc = "Harpoon select 2" })
map("n", "<leader>3", function()
  local harpoon = require "harpoon"
  harpoon:list():select(3)
end, { desc = "Harpoon select 3" })
map("n", "<leader>4", function()
  local harpoon = require "harpoon"
  harpoon:list():select(4)
end, { desc = "Harpoon select 4" })
map("n", "<leader>5", function()
  local harpoon = require "harpoon"
  harpoon:list():select(5)
end, { desc = "Harpoon select 5" })

-- Tabufline
map("n", "<leader>X", function()
  require("nvchad.tabufline").closeOtherBufs()
end, { desc = "Close other buffers" })
map("n", "<leader><Tab>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Move buffer forward" })
map("n", "<leader><S-Tab>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Move buffer backward" })
map("n", "<leader>u", function()
  if vim.opt.showtabline._value == 2 then
    vim.opt.showtabline = 0
  else
    vim.opt.showtabline = 2
  end
end, { desc = "Toggle tabufline" })

-- Disable ESLint LSP server and hide virtual text in Neovim
-- Add this to your init.lua or init.vim file
local isLspDiagnosticsVisible = true
map("n", "<leader>lx", function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config {
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible,
  }
end)
