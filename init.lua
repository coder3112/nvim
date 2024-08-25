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

vim.o.expandtab = true -- expand tab input with spaces characters
vim.o.smartindent = true -- syntax aware indentations for newline inserts
vim.o.tabstop = 2 -- num of space characters per tab
vim.o.shiftwidth = 2 -- spaces per indentation level

require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself
    {"nvim-treesitter/nvim-treesitter", build=':TSUpdate'}, -- TS is the best syntax highlighter there is.
    "stevearc/conform.nvim", --formatter
    "windwp/nvim-autopairs", -- close pairs of brackets,
    "stevearc/oil.nvim", -- file explorer that behaves like a neovim buffer.

}


-- File Explorer: Oil
require("oil").setup()

--UI
vim.cmd[[colorscheme torte]]

vim.opt.splitbelow = true --:split opens buffer below. very useful for terminal stuff.
vim.opt.splitright = true --:vsplit open buffer on right. more intuitive to me.
vim.opt.mouse = "a" --convenient mouse

-- Set line numbers. Current line is absolute, others are relative
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"


--Language

--Autoformating
require("conform").setup({
	formatters_by_ft = {
		lua = {"styllua"},
		rust = {"rustfmt", lsp_format = "fallback"}
	}
})

-- Autopairs
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})


--Project Management
--


-- Keybinds
-- Map leader to space
vim.g.mapleader = " "

vim.keymap.set("v", "y", "ygv<esc>") --After yanking in visual mode, cursor stays at end instead of jumping to beginning of selection.
vim.keymap.set("n", "p", "p=`]") --Paste preserves indentation.
vim.keymap.set("i", "<C-BS>", "<Esc>cvb", { }) --Ctrl-Backspace deletes previous word.

