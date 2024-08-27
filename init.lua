-- This is my ultimate config.
--
-- DONE: Package Manager
-- DONE: Treesitter 
-- FIX: Highlight TODO/DONE/FIX/ only for comments. Maybe come up with simple shell script to output/pretty print etc.
-- TODO: LSP
-- TODO: Snippets
-- TODO: Project Management 
-- 	- new files
-- 	- fzf DONE
-- 	- compile
-- 	- run
-- 	- test
--	- git DONE Decided to just use terminal/tmux/zellij/tabs/tilingwm. in short, not a neovim solution, but external.
--	- debug

vim.o.expandtab = true -- expand tab input with spaces characters
vim.o.smartindent = true -- syntax aware indentations for newline inserts
vim.o.tabstop = 4 -- num of space characters per tab
vim.o.shiftwidth = 4 -- spaces per indentation level

require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself
    {"nvim-treesitter/nvim-treesitter", build=':TSUpdate'}, -- TS is the best syntax highlighter there is.
    "stevearc/conform.nvim", --formatter
    "windwp/nvim-autopairs", -- close pairs of brackets,
    "stevearc/oil.nvim", -- file explorer that behaves like a neovim buffer.
    "nvim-lua/plenary.nvim";     -- Dependency required by Telescope
    "nvim-telescope/telescope.nvim"; -- The actual Telescope plugin
}


-- File Explorer: Oil
require("oil").setup({
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git'
      end,
    },
    win_options = {
      wrap = true,
    }
})


--UI
vim.cmd[[colorscheme vim]]

vim.opt.splitbelow = true --:split opens buffer below. very useful for terminal stuff.
vim.opt.splitright = true --:vsplit open buffer on right. more intuitive to me.
vim.opt.mouse = "a" --convenient mouse

-- Set line numbers. Current line is absolute, others are relative
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"


--Language
--
--------------HIGHLIGHT TODO-------------------------------------
---NOTE: THIS DOES NOT RELOAD WHEN COLOURSCHEME CHANGES. SO NEED TO
---      COMPLETELY RELOAD NEOVIM.
-- Define highlight groups with different colours
vim.api.nvim_set_hl(0, 'TodoTodo', { bg = 'blue', bold = true })
vim.api.nvim_set_hl(0, 'TodoFix', { bg = 'red', bold = true })
vim.api.nvim_set_hl(0, 'TodoDone', { bg = 'green', bold = true })

-- Create an autocommand group
vim.api.nvim_create_augroup('HighlightKeywords', { clear = true })

-- Create an autocommand to add highlights when entering a window or Vim
vim.api.nvim_create_autocmd({ 'WinEnter', 'VimEnter' }, {
    group = 'HighlightKeywords',
    callback = function()
        vim.fn.matchadd('TodoTodo', 'TODO', -1)
        vim.fn.matchadd('TodoFix', 'FIX', -1)
        vim.fn.matchadd('TodoDone', 'DONE', -1)
    end,
})
-----------------------------------------------------------------


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


-- Telescope Keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})


