local utils = {}

--- Returns a border
---@return table<string, string> border char, highlight
utils.border = function()
    return {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
    }
end

--- Bootstraps given repo
--- @param url string url of repo to bootstrap
utils.bootstrap = function (url)
  local dir_name = url:match("^.*%/(.*)")
local fn = vim.fn
   local install_path = string.format("%s/site/pack/packer/opt/%s", fn.stdpath("data"), dir_name)

   if fn.empty(fn.glob(install_path)) > 0 then
      print(string.format("Bootstrapping %s...", dir_name))
      fn.system { "git", "clone", "--depth", "1", url, install_path }
   end
  end

return utils