require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.g.guifont = "JetBrainsMonoNL NF Medium"
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true
vim.opt.colorcolumn="80"
vim.g.python3_host_prog = "C:/msys64/mingw64/bin/python3.exe"
local opts = {noremap = true}

vim.api.nvim_create_autocmd("FileType", { pattern = "rust", 
    callback = function()
        vim.api.nvim_buf_set_keymap(0,"n","<F5>",":RustDebuggables<CR>",opts)
        vim.api.nvim_buf_set_keymap(0,"n","<F9>",":DapToggleBreakpoint<CR>",opts)
    end})
	
