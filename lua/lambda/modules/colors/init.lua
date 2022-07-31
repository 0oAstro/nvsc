local colors_mod = {}

colors_mod.plugins = {
	["themer.lua"] = { "~/Public/themer.lua", event = "BufRead" },
}

colors_mod.configs = {
	["themer.lua"] = function()
		require("themer").setup({colorscheme = "gruvbox-light-medium", enable_installer = true,})
		if _G.MODULES.fuzzy == true then
	require("telescope").load_extension("themes")
end
	end,
}

return colors_mod
