-- This is my ultimate config.
--
-- DONE: Package Manager
-- TODO: Treesitter
-- TODO: Highlight TODO/DONE/FIX/BUG etc. Maybe come up with simple shell script to output/pretty print etc.
-- TODO: LSP
-- TODO: Snippets
-- TODO: Project Management 
-- 	- new files
-- 	- fzf
-- 	- compile
-- 	- run
-- 	- test
--	- git

require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself
}


--UI

vim.opt.splitbelow = true --:split opens buffer below. very useful for terminal stuff.
vim.opt.splitright = true --:vsplit open buffer on right. more intuitive to me.

-- Set line numbers. Current line is absolute, others are relative
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"


--Language
--


--Project Management
--


-- Keybinds
-- Map leader to space
vim.g.mapleader = " "

vim.keymap.set("v", "y", "ygv<esc>") --After yanking in visual mode, cursor stays at end instead of jumping to beginning of selection.
vim.keymap.set("n", "p", "p=`]") --Paste preserves indentation.
vim.keymap.set("i", "<C-BS>", "<Esc>cvb", { }) --Ctrl-Backspace deletes previous word.

