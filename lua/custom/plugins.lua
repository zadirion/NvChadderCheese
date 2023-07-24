local plugins = {
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require "custom.configs.null-ls"
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
        "rust-analyzer",
			}
		}
	},
	{
		"ThePrimeagen/vim-be-good",
		cmd = "VimBeGood",
		config = function()
		  require("VimBeGood").setup {}
		end,
	},
	 {
		"iamcco/markdown-preview.nvim",
		config = function()
		  vim.fn["mkdp#util#install"]()
		end,
	},
	{ 
		"iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, 
	},
	{
		"tpope/vim-fugitive",
		cmd = "G",
	},
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    'puremourning/vimspector',
    cmd = {'VimspectorInstall', 'VimspectorUpdate'}
  }

}


return plugins
