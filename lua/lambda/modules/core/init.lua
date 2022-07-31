local core_mod = {}

core_mod.plugins = {
    ["plenary.nvim"] = { "nvim-lua/plenary.nvim", module = "plenary", opt = true },
    ["packer.nvim"] = { "wbthomason/packer.nvim", opt = true, module = "packer" },
    ["impatient.nvim"] = { "lewis6991/impatient.nvim" },
}

core_mod.configs = {
    ["impatient.nvim"] = function() require("impatient").enable_profile() end,
}

return core_mod
