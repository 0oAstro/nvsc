_G.MODULES = {
	["core"] = true, ["treesitter"] = true, ["colors"] = true, ["statusline"] = false, ["fuzzy"] = true } -- modules to use
vim.cmd [[
    runtime! plugin/**/*.vim
    runtime! plugin/**/*.lua
]]

vim.opt.shadafile = ""

require("packer_compiled")

vim.cmd [[
	rshada!
	doautocmd BufRead
	filetype on
	filetype plugin indent on
]]

vim.defer_fn(function()
	require("lambda.modules")
	vim.cmd [[ 
		silent! bufdo e
	]]
end, 15)
