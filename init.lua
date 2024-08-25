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

-- Set line numbers. Current line is absolute, others are relative
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"


--Language
--


--Project Management
--


-- Keybinds
