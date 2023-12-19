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

require("lazy").setup({


	{'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' } },

    { 'EdenEast/nightfox.nvim',
    	priority = 1000,

    	config = function()
			vim.cmd([[colorscheme nightfox]])
		end,
	},

	{ 'ThePrimeagen/harpoon', 
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	},
	
-- no config plugins --
	{ 'CRAG666/code_runner.nvim', config = true },
	{ 'folke/which-key.nvim' },
	{ 'mbbill/undotree' },
	{ 'normen/vim-pio' },
-- LSP --
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
})

require('fenree/remaps')
require('plugin/coderunner')
require('plugin/harpoon')
require('plugin/telescope')
require('plugin/treesitter')
require('plugin/undotree')
require('plugin/LSP')
require('plugin/platformio')
