local utils = require("lambda.utils")

utils.bootstrap("https://github.com/wbthomason/packer.nvim")

vim.cmd([[packadd packer.nvim]])

local packer = require("packer")

packer.init({
	compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	git = {
		clone_timeout = 120, -- 2 mins
		subcommands = {
			-- Prevent packer from downloading and loading all branches metadata to reduce cloning cost
			-- for heavy size plugins like plenary (removed the '--no-single-branch' git flag)
			install = "clone --depth %i --progress",
		},
	},
	max_jobs = 10,
	display = {
		done_sym = "",
		error_syn = "×",
		open_fn = function()
			return require("packer.util").float({
				border = utils.border(),
			})
		end,
		keybindings = {
			toggle_info = "<TAB>",
		},
	},
	profile = {
		enable = true,
	},
	snapshot = "stable",
})

local use = packer.use

packer.reset()

local enabled_modules = _G.MODULES

for mod, is_enabled in pairs(enabled_modules) do
	if is_enabled then
	local ok_mod, module = pcall(require, (string.format("lambda.modules.%s", mod)))
		if not ok_mod then vim.notify(string.format("No such module found: %s", mod), vim.log.levels.ERROR) return end
	if module.configs then for plugin, _ in pairs(module.plugins) do module.plugins[plugin].config = module.configs[plugin] end end
	for _, plugin_spec in pairs(module.plugins) do
		use(plugin_spec)
		end
		end
end