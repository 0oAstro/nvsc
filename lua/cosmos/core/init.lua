vim.opt.shadafile = ""

vim.cmd [[
    runtime! plugin/**/*.vim
    runtime! plugin/**/*.lua
]]

vim.cmd [[
	rshada!
	doautocmd BufRead
	filetype on
	filetype plugin indent on
]]

vim.defer_fn(function()
	require("cosmos.ext")
	vim.cmd [[ 
		silent! bufdo e
	]]
end, 15)
