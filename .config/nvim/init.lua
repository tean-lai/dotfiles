vim.opt.nu = true
vim.opt.relativenumber = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--[[
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
--]]

vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>s", ":silent !$SHELL<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>y", '"+y<CR>', {})
vim.api.nvim_set_keymap("v", "<leader>y", '"+y<CR>', {})
vim.api.nvim_set_keymap("n", "<leader>p", '"+p<CR>', {})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
