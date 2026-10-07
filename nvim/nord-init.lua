-- ~/.config/nvim/init.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- Enable colors
vim.o.termguicolors = true

-- Configure plugins

require("lazy").setup("plugins")
vim.cmd.colorscheme("nordic")
-- Basic settings
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.tabstop = 2           -- Number of spaces a tab counts for
vim.opt.shiftwidth = 2        -- Size of an indent
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.smartindent = true    -- Auto indent
vim.opt.cursorline = true
