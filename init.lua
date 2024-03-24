-- This is my ultimate config.
--
-- TODO: Package Manager
-- TODO: Treesitter
-- TODO: LSP
-- TODO: Snippets
-- TODO: Project Management 
-- 	- new files
-- 	- fzf
-- 	- compile
-- 	- run
-- 	- test


--UI

-- Set line numbers. Current line is absolute, others are relativ
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"


--Language
--


--Project Management
--


-- Keybinds

--Convinience functions to port map, nmap
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

nmap("<C-s>", ":w<CR>") --Ctrl+S to save
imap("<C-s>", "<Esc>:w<CR>") --Ctrl+S to save
