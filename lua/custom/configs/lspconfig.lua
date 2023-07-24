local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
capabilities.offsetEncoding = { "utf-16" }
local util = require "lspconfig/util"

local lspconfig = require("lspconfig")
lspconfig.clangd.setup {
	on_attach = function(client, bufnr)
		client.server_capabilities.signatureHelpProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities
	
}
lspconfig.tsserver.setup{}

vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})

