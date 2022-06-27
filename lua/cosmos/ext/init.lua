local utils = require("cosmos.utils")

utils.bootstrap("https://github.com/savq/paq-nvim")
utils.bootstrap("https://github.com/chromosore/lazily-nvim")

vim.cmd([[packadd paq-nvim]])
vim.cmd([[packadd lazily-nvim]])

local lazily = require("lazily")

local plugins = {
	-- Our alternative to packer
	["paq-nvim"] = { "savq/paq-nvim", opt = true },
	["lazily-nvim"] = { "chromosore/lazily-nvim", opt = true },
	
	-- Syntax Highlighting
	["nvim-treesitter"] = { "nvim-treesitter/nvim-treesitter", opt = true, run = function() vim.cmd([[TSUpdate]]) end}
}

local paq_plugins = {}

for plugin, plugin_spec in pairs(plugins) do
	paq_plugins[#paq_plugins+1] = plugin_spec
	lazily.use(plugin, plugin_spec)
end

require("paq")(paq_plugins)